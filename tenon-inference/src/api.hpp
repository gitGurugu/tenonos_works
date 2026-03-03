/*
 * TenonOS Inference Framework - Core API Header (C++)
 */

#ifndef TN_INFER_API_HPP
#define TN_INFER_API_HPP

#include <cstdint>
#include <cstddef>
#include <cstdio>

#ifdef __Unikraft__
#include <uk/print.h>
#endif

#ifdef __cplusplus
extern "C" {
#endif

/* ========== C API 类型定义 ========== */

/* 错误码 */
#define TN_INFER_SUCCESS           0
#define TN_INFER_ERR_INVALID      -1
#define TN_INFER_ERR_NOMEM        -2
#define TN_INFER_ERR_LOAD_FAILED  -3
#define TN_INFER_ERR_NO_MODEL     -4
#define TN_INFER_ERR_UNSUPPORTED  -5

/* 日志级别 */
#define TN_LOG_LEVEL_ERROR  0
#define TN_LOG_LEVEL_WARN   1
#define TN_LOG_LEVEL_INFO   2
#define TN_LOG_LEVEL_DEBUG  3

/* 日志宏 */
#ifdef __Unikraft__
#define TN_LOG_ERROR(fmt, ...)  do { if (g_log_level >= TN_LOG_LEVEL_ERROR) uk_pr_err(fmt "\n", ##__VA_ARGS__); } while(0)
#define TN_LOG_WARN(fmt, ...)   do { if (g_log_level >= TN_LOG_LEVEL_WARN)  uk_pr_warn(fmt "\n", ##__VA_ARGS__); } while(0)
#define TN_LOG_INFO(fmt, ...)   do { if (g_log_level >= TN_LOG_LEVEL_INFO)  uk_pr_info(fmt "\n", ##__VA_ARGS__); } while(0)
#define TN_LOG_DEBUG(fmt, ...)  do { if (g_log_level >= TN_LOG_LEVEL_DEBUG) uk_pr_info(fmt "\n", ##__VA_ARGS__); } while(0)
#else
#define TN_LOG_ERROR(fmt, ...)  do { if (g_log_level >= TN_LOG_LEVEL_ERROR) printf("[ERROR] " fmt "\n", ##__VA_ARGS__); } while(0)
#define TN_LOG_WARN(fmt, ...)   do { if (g_log_level >= TN_LOG_LEVEL_WARN)  printf("[WARN]  " fmt "\n", ##__VA_ARGS__); } while(0)
#define TN_LOG_INFO(fmt, ...)   do { if (g_log_level >= TN_LOG_LEVEL_INFO)  printf("[INFO]  " fmt "\n", ##__VA_ARGS__); } while(0)
#define TN_LOG_DEBUG(fmt, ...)  do { if (g_log_level >= TN_LOG_LEVEL_DEBUG) printf("[DEBUG] " fmt "\n", ##__VA_ARGS__); } while(0)
#endif

/* 前向声明 */
struct tn_infer_handle;
typedef struct tn_infer_handle* tn_infer_t;

struct tn_threadpool;
typedef struct tn_threadpool tn_threadpool_t;

struct tn_mempool;
typedef struct tn_mempool tn_mempool_t;

struct tn_scheduler;
typedef struct tn_scheduler tn_scheduler_t;

struct tn_batch;
typedef struct tn_batch tn_batch_t;

struct tn_loader;
typedef struct tn_loader tn_loader_t;

struct tn_metrics;
typedef struct tn_metrics tn_metrics_t;

/* 配置结构 */
typedef struct {
    size_t thread_count;
    size_t queue_size;
    bool batch_enabled;
    size_t batch_max_size;
    size_t batch_timeout_us;
    bool preemptive;
    int default_priority;
    size_t max_model_size;
    bool multi_model_enabled;
    size_t total_mem_limit;
    bool metrics_enabled;
    bool trace_enabled;
    int log_level;
} tn_infer_config_t;

/* 线程池配置 */
typedef struct {
    size_t thread_count;
    size_t queue_size;
    bool enable_priority;
    bool enable_preemptive;
} tn_threadpool_config_t;

/* 批处理配置 */
typedef struct {
    size_t max_batch_size;
    size_t timeout_us;
} tn_batch_config_t;

/* 推理请求 */
typedef struct {
    const void* input_data;
    size_t input_size;
    void* output_data;
    size_t output_size;
    const char* model_name;
    int priority;
    void* user_data;
} tn_infer_request_t;

/* 推理结果 */
typedef struct {
    int error_code;
    size_t output_size;
    uint64_t latency_us;
    void* user_data;
} tn_infer_result_t;

/* 模型信息 */
typedef struct {
    char name[64];
    char path[256];
    bool loaded;
    int version;
    size_t size;
} tn_model_info_t;

/* 指标结构 */
typedef struct {
    uint64_t total_requests;
    uint64_t success_count;
    uint64_t error_count;
    uint64_t avg_latency_us;
    uint64_t min_latency_us;
    uint64_t max_latency_us;
    uint64_t latency_p50;
    uint64_t latency_p95;
    uint64_t latency_p99;
    uint64_t qps_x100;
    size_t memory_used;
    size_t memory_peak;
} tn_infer_metrics_t;

/* 全局日志级别 */
extern int g_log_level;

/* ========== C API 函数声明 ========== */

/* 日志 */
void tn_logger_init(int level);

/* 推理框架 */
tn_infer_t tn_infer_create(const tn_infer_config_t *config);
int tn_infer_destroy(tn_infer_t handle);
int tn_infer_load(tn_infer_t handle, const char *model_path, const char *model_name);
int tn_infer_unload(tn_infer_t handle, const char *model_name);
int tn_infer(tn_infer_t handle, tn_infer_request_t *request, tn_infer_result_t *result);
int tn_infer_async(tn_infer_t handle, tn_infer_request_t *request);
int tn_infer_get_metrics(tn_infer_t handle, tn_infer_metrics_t *metrics);
int tn_infer_list_models(tn_infer_t handle, tn_model_info_t *models, int max_count);
int tn_infer_switch_version(tn_infer_t handle, const char *model_name, int version);
int tn_infer_set_memory_limit(tn_infer_t handle, const char *model_name, size_t memory_limit);

/* 线程池 */
tn_threadpool_t* tn_threadpool_create(const tn_threadpool_config_t *config);
int tn_threadpool_destroy(tn_threadpool_t *pool);
int tn_threadpool_submit(tn_threadpool_t *pool, void (*fn)(void*), void *arg, int priority);
int tn_threadpool_wait(tn_threadpool_t *pool);

/* 内存池 */
tn_mempool_t* tn_mempool_create(size_t total_size);
int tn_mempool_destroy(tn_mempool_t *pool);
void* tn_mempool_alloc(tn_mempool_t *pool, size_t size);
int tn_mempool_free(tn_mempool_t *pool, void *ptr);

/* 调度器 */
tn_scheduler_t* tn_scheduler_create(bool preemptive);
int tn_scheduler_destroy(tn_scheduler_t *scheduler);
int tn_scheduler_add_task(tn_scheduler_t *scheduler, void (*fn)(void*), void *arg, int priority);

/* 批处理 */
tn_batch_t* tn_batch_create(const tn_batch_config_t *config);
int tn_batch_destroy(tn_batch_t *batch);
int tn_batch_add(tn_batch_t *batch, void *request);
void* tn_batch_process(tn_batch_t *batch);

/* 模型加载器 */
tn_loader_t* tn_loader_create(size_t max_model_size);
int tn_loader_destroy(tn_loader_t *loader);
int tn_loader_load(tn_loader_t *loader, const char *path, const char *name);
int tn_loader_unload(tn_loader_t *loader, const char *name);
void* tn_loader_get_model(tn_loader_t *loader, const char *name);

/* 指标收集 */
tn_metrics_t* tn_metrics_create(size_t history_size);
int tn_metrics_destroy(tn_metrics_t *metrics);
int tn_metrics_record(tn_metrics_t *metrics, uint64_t latency_us, size_t batch_size, bool success);
int tn_metrics_collect(tn_metrics_t *metrics, tn_infer_metrics_t *out);

#ifdef __cplusplus
}
#endif

/* ========== C++ API ========== */

#ifdef __cplusplus

namespace tenon {
namespace inference {

// C++ wrapper for C API structures
struct Metrics {
    uint64_t total_requests;
    uint64_t success_count;
    uint64_t error_count;
    uint64_t avg_latency_us;
    uint64_t min_latency_us;
    uint64_t max_latency_us;
    double success_rate;
    
    Metrics()
        : total_requests(0)
        , success_count(0)
        , error_count(0)
        , avg_latency_us(0)
        , min_latency_us(0)
        , max_latency_us(0)
        , success_rate(0.0) {}
};

} // namespace inference
} // namespace tenon

#endif /* __cplusplus */

#endif /* TN_INFER_API_HPP */
