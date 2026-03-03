/*
 * TenonOS Inference Framework - Metrics Implementation (C++)
 */

#include "metrics.hpp"
#include "api.hpp"
#include "logger.hpp"
#include <uk/alloc.h>
#include <uk/plat/time.h>
#include <uk/arch/time.h>
#include <cstring>
#include <new>

namespace tenon {
namespace inference {

MetricsCollector::MetricsCollector(size_t history_size)
    : samples_(nullptr)
    , history_size_(history_size)
    , head_(0)
    , count_(0)
    , total_requests_(0)
    , success_count_(0)
    , error_count_(0)
    , latency_sum_(0)
    , latency_min_(UINT64_MAX)
    , latency_max_(0)
    , alloc_(uk_alloc_get_default()) {
    
    samples_ = static_cast<MetricsSample*>(
        uk_zalloc(alloc_, history_size_ * sizeof(MetricsSample)));
    if (!samples_) {
        Logger::GetInstance().Error("Failed to allocate metrics samples");
        return;
    }
    
    Logger::GetInstance().Info("Metrics collector created (history: %zu)", history_size_);
}

MetricsCollector::~MetricsCollector() {
    if (samples_) {
        uk_free(alloc_, samples_);
    }
}

MetricsCollector::MetricsCollector(MetricsCollector&& other) noexcept
    : samples_(other.samples_)
    , history_size_(other.history_size_)
    , head_(other.head_)
    , count_(other.count_)
    , total_requests_(other.total_requests_)
    , success_count_(other.success_count_)
    , error_count_(other.error_count_)
    , latency_sum_(other.latency_sum_)
    , latency_min_(other.latency_min_)
    , latency_max_(other.latency_max_)
    , alloc_(other.alloc_) {
    other.samples_ = nullptr;
    other.count_ = 0;
}

MetricsCollector& MetricsCollector::operator=(MetricsCollector&& other) noexcept {
    if (this != &other) {
        if (samples_) {
            uk_free(alloc_, samples_);
        }
        
        samples_ = other.samples_;
        history_size_ = other.history_size_;
        head_ = other.head_;
        count_ = other.count_;
        total_requests_ = other.total_requests_;
        success_count_ = other.success_count_;
        error_count_ = other.error_count_;
        latency_sum_ = other.latency_sum_;
        latency_min_ = other.latency_min_;
        latency_max_ = other.latency_max_;
        alloc_ = other.alloc_;
        
        other.samples_ = nullptr;
        other.count_ = 0;
    }
    return *this;
}

void MetricsCollector::Record(uint64_t latency_us, size_t batch_size, bool success) {
    if (!samples_) {
        return;
    }
    
    __nsec now_ns = ukplat_monotonic_clock();
    uint64_t now_us = ukarch_time_nsec_to_usec(now_ns);
    
    // 更新循环缓冲区
    size_t idx = head_ % history_size_;
    samples_[idx].timestamp_us = now_us;
    samples_[idx].latency_us = latency_us;
    samples_[idx].batch_size = batch_size;
    samples_[idx].success = success;
    
    head_++;
    if (count_ < history_size_) {
        count_++;
    }
    
    // 更新聚合统计
    total_requests_++;
    if (success) {
        success_count_++;
    } else {
        error_count_++;
    }
    
    latency_sum_ += latency_us;
    if (latency_us < latency_min_) {
        latency_min_ = latency_us;
    }
    if (latency_us > latency_max_) {
        latency_max_ = latency_us;
    }
}

void MetricsCollector::Collect(Metrics& out) const {
    if (!samples_) {
        out = Metrics{};
        return;
    }
    
    out.total_requests = total_requests_;
    out.success_count = success_count_;
    out.error_count = error_count_;
    
    if (total_requests_ > 0) {
        out.avg_latency_us = latency_sum_ / total_requests_;
        out.min_latency_us = latency_min_;
        out.max_latency_us = latency_max_;
    } else {
        out.avg_latency_us = 0;
        out.min_latency_us = 0;
        out.max_latency_us = 0;
    }
    
    // 计算成功率
    if (total_requests_ > 0) {
        out.success_rate = (double)success_count_ / total_requests_;
    } else {
        out.success_rate = 0.0;
    }
}

} // namespace inference
} // namespace tenon

/* C API 包装器 */
#ifdef __cplusplus
extern "C" {
#endif

struct tn_metrics {
    tenon::inference::MetricsCollector* impl;
};

tn_metrics_t* tn_metrics_create(size_t history_size) {
    tenon::inference::MetricsCollector* metrics = new(std::nothrow) tenon::inference::MetricsCollector(history_size);
    if (!metrics || !metrics->IsValid()) {
        delete metrics;
        return nullptr;
    }
    
    tn_metrics_t* handle = static_cast<tn_metrics_t*>(
        uk_zalloc(uk_alloc_get_default(), sizeof(struct tn_metrics)));
    if (!handle) {
        delete metrics;
        return nullptr;
    }
    
    handle->impl = metrics;
    return handle;
}

int tn_metrics_destroy(tn_metrics_t *metrics) {
    if (!metrics) {
        return TN_INFER_ERR_INVALID;
    }
    
    delete metrics->impl;
    uk_free(uk_alloc_get_default(), metrics);
    
    return TN_INFER_SUCCESS;
}

int tn_metrics_record(tn_metrics_t *metrics, uint64_t latency_us, size_t batch_size, bool success) {
    if (!metrics) {
        return TN_INFER_ERR_INVALID;
    }
    
    metrics->impl->Record(latency_us, batch_size, success);
    return TN_INFER_SUCCESS;
}

int tn_metrics_collect(tn_metrics_t *metrics, tn_infer_metrics_t *out) {
    if (!metrics || !out) {
        return TN_INFER_ERR_INVALID;
    }
    
    tenon::inference::Metrics cpp_metrics;
    metrics->impl->Collect(cpp_metrics);
    
    out->total_requests = cpp_metrics.total_requests;
    out->success_count = cpp_metrics.success_count;
    out->error_count = cpp_metrics.error_count;
    out->avg_latency_us = cpp_metrics.avg_latency_us;
    out->min_latency_us = cpp_metrics.min_latency_us;
    out->max_latency_us = cpp_metrics.max_latency_us;
    out->latency_p50 = cpp_metrics.avg_latency_us;  // TODO: 计算实际分位数
    out->latency_p95 = cpp_metrics.avg_latency_us;
    out->latency_p99 = cpp_metrics.avg_latency_us;
    out->qps_x100 = 0;  // TODO: 计算 QPS
    out->memory_used = 0;
    out->memory_peak = 0;
    
    return TN_INFER_SUCCESS;
}

#ifdef __cplusplus
}
#endif
