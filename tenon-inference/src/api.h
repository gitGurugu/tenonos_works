/*
 * TenonOS Inference Framework - Core API Header
 *
 * Authors: Your Name <your@email.com>
 */

#ifndef TN_INFER_API_H
#define TN_INFER_API_H

#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#ifdef __cplusplus
extern "C" {
#endif

/* ============================================
 * 错误码定义
 * ============================================ */
#define TN_INFER_SUCCESS          0
#define TN_INFER_ERR_INVALID     -1    /* 无效参数 */
#define TN_INFER_ERR_NOMEM       -2    /* 内存不足 */
#define TN_INFER_ERR_LOAD_FAILED -3    /* 模型加载失败 */
#define TN_INFER_ERR_INFER       -4    /* 推理失败 */
#define TN_INFER_ERR_NO_MODEL    -5    /* 模型未加载 */
#define TN_INFER_ERR_BUSY        -6    /* 资源忙 */
#define TN_INFER_ERR_UNSUPPORTED -7    /* 不支持 */
#define TN_INFER_ERR_TIMEOUT     -8    /* 超时 */

/* ============================================
 * 配置结构体
 * ============================================ */
typedef struct tn_infer_config {
    /* 线程池配置 */
    size_t thread_count;          /* 工作线程数 */
    size_t queue_size;            /* 请求队列大小 */
    
    /* 批处理配置 */
    bool   batch_enabled;         /* 启用批处理 */
    size_t batch_max_size;       /* 最大批大小 */
    size_t batch_timeout_us;     /* 批处理超时(微秒) */
    
    /* 调度配置 */
    bool   preemptive;            /* 启用抢占式调度 */
    int    default_priority;     /* 默认优先级 */
    
    /* 模型配置 */
    size_t max_model_size;       /* 单个模型最大内存 */
    bool   multi_model_enabled;  /* 启用多模型支持 */
    size_t total_mem_limit;      /* 总内存限制 */
    
    /* 可观测性配置 */
    bool   metrics_enabled;      /* 启用指标收集 */
    bool   trace_enabled;        /* 启用追踪 */
    int    log_level;            /* 日志级别 */
} tn_infer_config_t;

/* ============================================
 * 推理请求结构体
 * ============================================ */
typedef struct tn_infer_request {
    void        *input_data;     /* 输入数据 */
    size_t      input_size;      /* 输入大小 */
    void        *output_data;    /* 输出缓冲区 */
    size_t      output_size;     /* 输出大小 */
    int         priority;        /* 请求优先级 */
    void        *user_data;      /* 用户数据 */
    void        (*callback)(struct tn_infer_request *req, int result); /* 异步回调 */
} tn_infer_request_t;

/* ============================================
 * 推理结果结构体
 * ============================================ */
typedef struct tn_infer_result {
    void       *output_data;     /* 输出数据 */
    size_t     output_size;      /* 输出大小 */
    uint64_t   latency_us;      /* 延迟(微秒) */
    int        error_code;      /* 错误码 */
} tn_infer_result_t;

/* ============================================
 * 指标结构体
 * ============================================ */
typedef struct tn_infer_metrics {
    /* 吞吐量 */
    uint64_t   total_requests;   /* 总请求数 */
    uint64_t   qps_x100;         /* QPS x 100 (避免浮点) */
    
    /* 延迟统计(微秒) */
    uint64_t   latency_min;
    uint64_t   latency_max;
    uint64_t   latency_p50;
    uint64_t   latency_p95;
    uint64_t   latency_p99;
    
    /* 资源使用 */
    size_t     memory_used;      /* 已用内存 */
    size_t     memory_peak;      /* 峰值内存 */
    uint32_t   cpu_usage_x100;   /* CPU使用率 x 100 */
    
    /* 批处理统计 */
    uint64_t   batch_count;      /* 批处理次数 */
    uint32_t   avg_batch_size_x100; /* 平均批大小 x 100 */
} tn_infer_metrics_t;

/* ============================================
 * 模型信息结构体
 * ============================================ */
typedef struct tn_model_info {
    char       name[64];         /* 模型名称 */
    char       path[256];        /* 模型路径 */
    size_t     size;             /* 模型大小(字节) */
    int        version;          /* 模型版本 */
    bool       loaded;           /* 是否已加载 */
} tn_model_info_t;

/* ============================================
 * 推理框架句柄
 * ============================================ */
typedef struct tn_infer_handle *tn_infer_t;

/* ============================================
 * 标准化 API
 * ============================================ */

/**
 * @brief 创建推理框架实例
 * @param config 配置参数 (NULL使用默认配置)
 * @return 推理框架句柄, NULL表示失败
 */
tn_infer_t tn_infer_create(const tn_infer_config_t *config);

/**
 * @brief 销毁推理框架实例
 * @param handle 推理框架句柄
 * @return 0表示成功
 */
int tn_infer_destroy(tn_infer_t handle);

/**
 * @brief 加载模型
 * @param handle 推理框架句柄
 * @param model_path 模型文件路径
 * @param model_name 模型名称
 * @return 0表示成功
 */
int tn_infer_load(tn_infer_t handle, const char *model_path, const char *model_name);

/**
 * @brief 卸载模型
 * @param handle 推理框架句柄
 * @param model_name 模型名称
 * @return 0表示成功
 */
int tn_infer_unload(tn_infer_t handle, const char *model_name);

/**
 * @brief 同步推理
 * @param handle 推理框架句柄
 * @param request 推理请求
 * @param result 推理结果
 * @return 0表示成功
 */
int tn_infer(tn_infer_t handle, tn_infer_request_t *request, tn_infer_result_t *result);

/**
 * @brief 异步推理
 * @param handle 推理框架句柄
 * @param request 推理请求
 * @return 0表示成功
 */
int tn_infer_async(tn_infer_t handle, tn_infer_request_t *request);

/**
 * @brief 获取指标
 * @param handle 推理框架句柄
 * @param metrics 指标结构体
 * @return 0表示成功
 */
int tn_infer_get_metrics(tn_infer_t handle, tn_infer_metrics_t *metrics);

/**
 * @brief 获取已加载模型列表
 * @param handle 推理框架句柄
 * @param models 模型数组
 * @param max_count 最大数量
 * @return 实际数量
 */
int tn_infer_list_models(tn_infer_t handle, tn_model_info_t *models, int max_count);

/**
 * @brief 切换模型版本
 * @param handle 推理框架句柄
 * @param model_name 模型名称
 * @param version 版本号
 * @return 0表示成功
 */
int tn_infer_switch_version(tn_infer_t handle, const char *model_name, int version);

/**
 * @brief 设置模型内存配额
 * @param handle 推理框架句柄
 * @param model_name 模型名称
 * @param memory_limit 内存限制(字节)
 * @return 0表示成功
 */
int tn_infer_set_memory_limit(tn_infer_t handle, const char *model_name, size_t memory_limit);

#ifdef __cplusplus
}
#endif

#endif /* TN_INFER_API_H */

