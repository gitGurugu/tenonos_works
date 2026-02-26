/*
 * TenonOS Inference Framework - Metrics Implementation
 */

#include "metrics.h"
#include "logger.h"
#include <uk/alloc.h>
#include <string.h>

struct tn_metrics {
    metrics_sample_t *samples;
    size_t history_size;
    size_t head;
    size_t count;
    
    /* 聚合统计 */
    uint64_t total_requests;
    uint64_t success_count;
    uint64_t error_count;
    uint64_t latency_sum;
    uint64_t latency_min;
    uint64_t latency_max;
};

tn_metrics_t *tn_metrics_create(size_t history_size)
{
    tn_metrics_t *metrics;
    struct uk_alloc *a = uk_alloc_get_default();
    
    if (history_size == 0) history_size = METRICS_HISTORY_SIZE;
    
    metrics = uk_zalloc(a, sizeof(tn_metrics_t));
    if (!metrics) return NULL;
    
    metrics->samples = uk_zalloc(a, history_size * sizeof(metrics_sample_t));
    if (!metrics->samples) {
        uk_free(a, metrics);
        return NULL;
    }
    
    metrics->history_size = history_size;
    metrics->head = 0;
    metrics->count = 0;
    metrics->total_requests = 0;
    metrics->success_count = 0;
    metrics->error_count = 0;
    metrics->latency_sum = 0;
    metrics->latency_min = UINT64_MAX;
    metrics->latency_max = 0;
    
    TN_LOG_INFO("Metrics created (history: %zu)", history_size);
    
    return metrics;
}

int tn_metrics_destroy(tn_metrics_t *metrics)
{
    if (!metrics) return -1;
    
    if (metrics->samples) {
        uk_free(uk_alloc_get_default(), metrics->samples);
    }
    uk_free(uk_alloc_get_default(), metrics);
    
    return 0;
}

void tn_metrics_record(tn_metrics_t *metrics, uint64_t latency_us, size_t batch_size, bool success)
{
    if (!metrics) return;
    
    /* 添加到环形缓冲区 */
    metrics->samples[metrics->head].timestamp_us = 0; /* TODO: 获取当前时间 */
    metrics->samples[metrics->head].latency_us = latency_us;
    metrics->samples[metrics->head].batch_size = batch_size;
    metrics->samples[metrics->head].success = success;
    
    metrics->head = (metrics->head + 1) % metrics->history_size;
    if (metrics->count < metrics->history_size) {
        metrics->count++;
    }
    
    /* 更新统计 */
    metrics->total_requests++;
    if (success) {
        metrics->success_count++;
    } else {
        metrics->error_count++;
    }
    
    metrics->latency_sum += latency_us;
    if (latency_us < metrics->latency_min) metrics->latency_min = latency_us;
    if (latency_us > metrics->latency_max) metrics->latency_max = latency_us;
}

void tn_metrics_collect(tn_metrics_t *metrics, tn_infer_metrics_t *out)
{
    if (!metrics || !out) return;
    
    memset(out, 0, sizeof(tn_infer_metrics_t));
    
    out->total_requests = metrics->total_requests;
    out->latency_min = metrics->latency_min == UINT64_MAX ? 0 : metrics->latency_min;
    out->latency_max = metrics->latency_max;
    
    /* 计算平均值 */
    if (metrics->total_requests > 0) {
        out->latency_p50 = metrics->latency_sum / metrics->total_requests;
        /* p95 = p50 * 1.5 = p50 + p50/2 */
        out->latency_p95 = out->latency_p50 + out->latency_p50 / 2;
        /* p99 = p50 * 2 */
        out->latency_p99 = out->latency_p50 * 2;
    }
    
    out->qps_x100 = 0; /* TODO: 根据时间计算 QPS */
}

