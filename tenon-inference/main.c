/* SPDX-License-Identifier: Apache-2.0 */
/*
 * TenonOS Inference Framework - Main Entry
 *
 * Authors: Your Name <your@email.com>
 */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

/* Import user configuration */
#ifdef __Unikraft__
#include <uk/config.h>
#endif

#include "src/api.h"
#include "src/threadpool.h"
#include "src/mempool.h"
#include "src/scheduler.h"
#include "src/batch.h"
#include "src/loader.h"
#include "src/metrics.h"
#include "src/logger.h"

static tn_infer_t g_infer_handle;

#ifdef CONFIG_APPINFERENCE_METRICS
static tn_metrics_t *g_metrics;
#endif

int main(int argc, char *argv[])
{
    (void)argc;
    (void)argv;
    
    /* 1. 初始化日志 */
    tn_logger_init(CONFIG_APPINFERENCE_LOG_LEVEL);
    TN_LOG_INFO("===========================================");
    TN_LOG_INFO("  TenonOS Inference Framework v0.1.0");
    TN_LOG_INFO("===========================================");
    TN_LOG_INFO("Build: %s %s", __DATE__, __TIME__);
    TN_LOG_INFO("Thread count: %d", CONFIG_APPINFERENCE_THREAD_COUNT);
    TN_LOG_INFO("Batch enabled: %d", CONFIG_APPINFERENCE_BATCH_ENABLED);
    TN_LOG_INFO("Preemptive scheduling: %d", CONFIG_APPINFERENCE_ENABLE_PREEMPTIVE);
    
    /* 2. 初始化指标模块 */
#ifdef CONFIG_APPINFERENCE_METRICS
    g_metrics = tn_metrics_create(1024);
    if (!g_metrics) {
        TN_LOG_ERROR("Failed to create metrics");
        return -1;
    }
    TN_LOG_INFO("Metrics collection enabled");
#endif
    
    /* 3. 配置推理框架 */
    tn_infer_config_t config = { 0 };
    config.thread_count = CONFIG_APPINFERENCE_THREAD_COUNT;
    config.queue_size = CONFIG_APPINFERENCE_QUEUE_SIZE;
    config.batch_enabled = CONFIG_APPINFERENCE_BATCH_ENABLED;
    config.batch_max_size = CONFIG_APPINFERENCE_BATCH_MAX_SIZE;
    config.batch_timeout_us = CONFIG_APPINFERENCE_BATCH_TIMEOUT_US;
    config.preemptive = CONFIG_APPINFERENCE_ENABLE_PREEMPTIVE;
    config.metrics_enabled = CONFIG_APPINFERENCE_METRICS;
    config.trace_enabled = false;  /* Trace 功能暂时禁用 */
    config.max_model_size = CONFIG_APPINFERENCE_MAX_MODEL_SIZE * 1024 * 1024;
    config.multi_model_enabled = CONFIG_APPINFERENCE_ENABLE_MULTI_MODEL;
    config.total_mem_limit = CONFIG_APPINFERENCE_MODEL_MEM_LIMIT * 1024 * 1024;
    
    /* 4. 创建推理实例 */
    g_infer_handle = tn_infer_create(&config);
    if (!g_infer_handle) {
        TN_LOG_ERROR("Failed to create inference handle");
#ifdef CONFIG_APPINFERENCE_METRICS
        tn_metrics_destroy(g_metrics);
#endif
        return -1;
    }
    TN_LOG_INFO("Inference handle created successfully");
    
    /* 5. 显示帮助信息 */
    printf("\n");
    printf("===========================================\n");
    printf("  Inference Framework Ready!\n");
    printf("===========================================\n");
    printf("\n");
    printf("Usage:\n");
    printf("  1. Load a model:   tn_infer_load(handle, \"/path/to/model\", \"model_name\")\n");
    printf("  2. Run inference:  tn_infer(handle, &request, &result)\n");
    printf("  3. Unload model:   tn_infer_unload(handle, \"model_name\")\n");
    printf("\n");
    printf("API Example:\n");
    printf("------------\n");
    printf("  tn_infer_request_t req = { 0 };\n");
    printf("  req.input_data = input_buffer;\n");
    printf("  req.input_size = input_size;\n");
    printf("  tn_infer(handle, &req, &result);\n");
    printf("\n");
    
    /* 6. 主循环 - 等待处理请求 */
    TN_LOG_INFO("Entering main loop...");
    
    /* 模拟简单的推理测试循环 */
    int iteration = 0;
    for (;;) {
        iteration++;
        
        /* 每 1000 次迭代打印一次状态 */
        if (iteration % 1000 == 0) {
#ifdef CONFIG_APPINFERENCE_METRICS
            tn_infer_metrics_t m;
            tn_metrics_collect(g_metrics, &m);
            TN_LOG_INFO("Stats - Requests: %lu, QPS: x100=%lu, Latency(p50): %lu us",
                       (unsigned long)m.total_requests,
                       (unsigned long)m.qps_x100,
                       (unsigned long)m.latency_p50);
#else
            TN_LOG_INFO("Iteration %d - Inference framework running", iteration);
#endif
        }
        
        /* 简单的延迟，避免空转太快 */
        /* 注意: 在真实环境中这里应该等待请求队列 */
        
        /* 演示推理过程（仅用于测试）*/
        if (iteration == 1) {
            TN_LOG_INFO("Ready to accept inference requests!");
        }
        
        /* 退出条件 - 按 q 退出 (需要实现) */
        /* 这里简单模拟，可以后续添加串口输入处理 */
    }
    
    /* 7. 清理 (永远不会执行到这里) */
    tn_infer_destroy(g_infer_handle);
    
#ifdef CONFIG_APPINFERENCE_METRICS
    tn_metrics_destroy(g_metrics);
#endif
    
    TN_LOG_INFO("Inference framework shutdown");
    
    return 0;
}

