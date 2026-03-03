/*
 * TenonOS Inference Framework - Core API Implementation (C++)
 */

#include "api.hpp"
#include "threadpool.hpp"
#include "mempool.hpp"
#include "scheduler.hpp"
#include "batch.hpp"
#include "loader.hpp"
#include "mnn_wrapper.hpp"
#include "metrics.hpp"
#include "logger.hpp"

#include <MNN/Tensor.hpp>
#include <uk/alloc.h>
#include <uk/print.h>
#include <uk/plat/time.h>
#include <cstring>
#include <cerrno>
#include <cstdint>
#include <vector>
#include <memory>

#ifdef __cplusplus
extern "C" {
#endif

/* 前向声明 */
static uint64_t tn_get_time_us(void);

/* 推理框架内部结构 */
struct tn_infer_handle {
    tn_infer_config_t config;
    
    /* 线程池 */
    tn_threadpool_t *threadpool;
    
    /* 内存池 */
    tn_mempool_t *mempool;
    
    /* 调度器 */
    tn_scheduler_t *scheduler;
    
    /* 批处理器 */
    tn_batch_t *batch;
    
    /* 模型加载器 */
    tn_loader_t *loader;
    
    /* 指标收集 */
    tn_metrics_t *metrics;
    
    /* 模型列表 */
    tn_model_info_t *models;
    int model_count;
    int max_models;
    
    /* 内存统计 */
    size_t total_memory_used;
    size_t peak_memory_used;
    
    /* 状态 */
    bool initialized;
    bool shutdown;
};

/* 默认配置 */
static const tn_infer_config_t default_config = {
    .thread_count = 4,
    .queue_size = 256,
    .batch_enabled = true,
    .batch_max_size = 8,
    .batch_timeout_us = 1000,
    .preemptive = true,
    .default_priority = 0,
    .max_model_size = 512 * 1024 * 1024,
    .multi_model_enabled = true,
    .total_mem_limit = 1024 * 1024 * 1024,
    .metrics_enabled = true,
    .trace_enabled = false,
    .log_level = 2
};

tn_infer_t tn_infer_create(const tn_infer_config_t *config)
{
    struct uk_alloc *a = uk_alloc_get_default();
    tn_infer_t handle;
    
    /* 分配句柄 */
    uk_pr_info("tn_infer_create: entering (config=%p)\n", config);
    handle = static_cast<tn_infer_t>(uk_zalloc(a, sizeof(struct tn_infer_handle)));
    if (!handle) {
        TN_LOG_ERROR("Failed to allocate inference handle");
        uk_pr_crit("tn_infer_create: uk_zalloc for handle failed\n");
        return nullptr;
    }
    
    /* 使用默认配置或用户配置 */
    if (config) {
        std::memcpy(&handle->config, config, sizeof(tn_infer_config_t));
    } else {
        std::memcpy(&handle->config, &default_config, sizeof(tn_infer_config_t));
    }
    
    TN_LOG_INFO("Creating inference framework with config:");
    TN_LOG_INFO("  Thread count: %zu", handle->config.thread_count);
    TN_LOG_INFO("  Queue size: %zu", handle->config.queue_size);
    TN_LOG_INFO("  Batch enabled: %d, max size: %zu", 
                handle->config.batch_enabled, handle->config.batch_max_size);
    TN_LOG_INFO("  Preemptive: %d", handle->config.preemptive);
    
    /* 初始化内存池 */
    uk_pr_info("tn_infer_create: creating mempool, limit=%zu\n",
               (size_t)handle->config.total_mem_limit);
    handle->mempool = tn_mempool_create(handle->config.total_mem_limit);
    if (!handle->mempool) {
        TN_LOG_ERROR("Failed to create memory pool");
        uk_pr_crit("tn_infer_create: tn_mempool_create failed\n");
        uk_free(a, handle);
        return nullptr;
    }
    
    /* 初始化线程池 */
    tn_threadpool_config_t tp_config = {
        .thread_count = handle->config.thread_count,
        .queue_size = handle->config.queue_size,
        .enable_priority = true,
        .enable_preemptive = handle->config.preemptive
    };
    uk_pr_info("tn_infer_create: creating threadpool: threads=%zu, queue_size=%zu\n",
               (size_t)tp_config.thread_count,
               (size_t)tp_config.queue_size);
    handle->threadpool = tn_threadpool_create(&tp_config);
    if (!handle->threadpool) {
        TN_LOG_ERROR("Failed to create thread pool");
        uk_pr_crit("tn_infer_create: tn_threadpool_create failed\n");
        tn_mempool_destroy(handle->mempool);
        uk_free(a, handle);
        return nullptr;
    }
    
    /* 初始化调度器 */
    uk_pr_info("tn_infer_create: creating scheduler (preemptive=%d)\n",
               handle->config.preemptive);
    handle->scheduler = tn_scheduler_create(handle->config.preemptive);
    if (!handle->scheduler) {
        TN_LOG_ERROR("Failed to create scheduler");
        uk_pr_crit("tn_infer_create: tn_scheduler_create failed\n");
        tn_threadpool_destroy(handle->threadpool);
        tn_mempool_destroy(handle->mempool);
        uk_free(a, handle);
        return nullptr;
    }
    
    /* 初始化批处理器 */
    if (handle->config.batch_enabled) {
        tn_batch_config_t batch_config = {
            .max_batch_size = handle->config.batch_max_size,
            .timeout_us = handle->config.batch_timeout_us
        };
        uk_pr_info("tn_infer_create: creating batch processor (max_size=%zu, timeout_us=%llu)\n",
                   (size_t)batch_config.max_batch_size,
                   (unsigned long long)batch_config.timeout_us);
        handle->batch = tn_batch_create(&batch_config);
        if (!handle->batch) {
            TN_LOG_WARN("Failed to create batch processor, running without batching");
            uk_pr_warn("tn_infer_create: tn_batch_create failed, continue without batching\n");
        }
    }
    
    /* 初始化模型加载器 */
    uk_pr_info("tn_infer_create: creating loader (max_model_size=%zu)\n",
               (size_t)handle->config.max_model_size);
    handle->loader = tn_loader_create(handle->config.max_model_size);
    if (!handle->loader) {
        TN_LOG_WARN("Failed to create model loader");
        uk_pr_warn("tn_infer_create: tn_loader_create failed (loader=NULL)\n");
    }
    
    /* 初始化指标收集 */
    if (handle->config.metrics_enabled) {
        uk_pr_info("tn_infer_create: creating metrics\n");
        handle->metrics = tn_metrics_create(1024);
        if (!handle->metrics) {
            TN_LOG_WARN("Failed to create metrics");
            uk_pr_warn("tn_infer_create: tn_metrics_create failed, disable metrics\n");
            handle->config.metrics_enabled = false;
        }
    }
    
    /* 初始化模型数组 */
    handle->max_models = handle->config.multi_model_enabled ? 16 : 1;
    uk_pr_info("tn_infer_create: allocating model array, max_models=%d\n",
               handle->max_models);
    handle->models = static_cast<tn_model_info_t*>(
        uk_zalloc(a, handle->max_models * sizeof(tn_model_info_t)));
    if (!handle->models) {
        TN_LOG_ERROR("Failed to allocate model array");
        uk_pr_crit("tn_infer_create: uk_zalloc for models failed\n");
        tn_scheduler_destroy(handle->scheduler);
        tn_threadpool_destroy(handle->threadpool);
        tn_mempool_destroy(handle->mempool);
        uk_free(a, handle);
        return nullptr;
    }
    handle->model_count = 0;
    
    handle->initialized = true;
    handle->shutdown = false;
    handle->total_memory_used = 0;
    handle->peak_memory_used = 0;
    
    TN_LOG_INFO("Inference framework created successfully");
    uk_pr_info("tn_infer_create: success, handle=%p\n", (void *)handle);
    
    return handle;
}

int tn_infer_destroy(tn_infer_t handle)
{
    struct uk_alloc *a = uk_alloc_get_default();
    
    if (!handle) {
        return TN_INFER_ERR_INVALID;
    }
    
    handle->shutdown = true;
    
    /* 卸载所有模型 */
    for (int i = 0; i < handle->model_count; i++) {
        if (handle->models[i].loaded) {
            tn_infer_unload(handle, handle->models[i].name);
        }
    }
    
    /* 销毁各组件 */
    if (handle->batch) {
        tn_batch_destroy(handle->batch);
    }
    if (handle->scheduler) {
        tn_scheduler_destroy(handle->scheduler);
    }
    if (handle->threadpool) {
        tn_threadpool_destroy(handle->threadpool);
    }
    if (handle->mempool) {
        tn_mempool_destroy(handle->mempool);
    }
    if (handle->metrics) {
        tn_metrics_destroy(handle->metrics);
    }
    
    /* 释放模型数组 */
    uk_free(a, handle->models);
    
    /* 释放句柄 */
    uk_free(a, handle);
    
    TN_LOG_INFO("Inference framework destroyed");
    
    return TN_INFER_SUCCESS;
}

int tn_infer_load(tn_infer_t handle, const char *model_path, const char *model_name)
{
    int ret;
    tn_model_info_t *model = nullptr;
    
    if (!handle || !model_path || !model_name) {
        uk_pr_crit("tn_infer_load: invalid argument (handle=%p, model_path=%p, model_name=%p)\n",
                   (void *)handle, model_path, model_name);
        return TN_INFER_ERR_INVALID;
    }
    
    if (!handle->initialized) {
        uk_pr_crit("tn_infer_load: handle not initialized\n");
        return TN_INFER_ERR_INVALID;
    }
    
    /* 查找或创建模型槽位 */
    uk_pr_info("tn_infer_load: searching model slot, current_count=%d, max_models=%d\n",
               handle->model_count, handle->max_models);
    for (int i = 0; i < handle->model_count; i++) {
        if (std::strcmp(handle->models[i].name, model_name) == 0) {
            model = &handle->models[i];
            break;
        }
    }
    
    if (!model && handle->model_count < handle->max_models) {
        uk_pr_info("tn_infer_load: using new model slot at index=%d\n",
                   handle->model_count);
        model = &handle->models[handle->model_count++];
    }
    
    if (!model) {
        TN_LOG_ERROR("No available model slot");
        uk_pr_crit("tn_infer_load: no available model slot (model_count=%d, max_models=%d)\n",
                   handle->model_count, handle->max_models);
        return TN_INFER_ERR_NOMEM;
    }
    
    /* 加载模型 */
    if (handle->loader) {
        uk_pr_info("tn_infer_load: about to call tn_loader_load(path=%s, name=%s)\n",
                   model_path, model_name);
        ret = tn_loader_load(handle->loader, model_path, model_name);
        if (ret != TN_INFER_SUCCESS) {
            TN_LOG_ERROR("Failed to load model: %s", model_path);
            uk_pr_crit("tn_infer_load: tn_loader_load failed, ret=%d\n", ret);
            return TN_INFER_ERR_LOAD_FAILED;
        }
        
        /* 获取模型大小 */
        uk_pr_info("tn_infer_load: about to get model pointer from loader\n");
        void* model_ptr = tn_loader_get_model(handle->loader, model_name);
        if (model_ptr) {
            tenon::inference::MNNWrapper* mnn = static_cast<tenon::inference::MNNWrapper*>(model_ptr);
            model->size = mnn->GetModelSize();
            uk_pr_info("tn_infer_load: model size=%zu bytes\n", model->size);
        } else {
            uk_pr_warn("tn_infer_load: tn_loader_get_model returned NULL\n");
        }
    } else {
        uk_pr_warn("tn_infer_load: loader is NULL, skipping tn_loader_load\n");
    }
    
    /* 更新模型信息 */
    std::strncpy(model->name, model_name, sizeof(model->name) - 1);
    model->name[sizeof(model->name) - 1] = '\0';
    std::strncpy(model->path, model_path, sizeof(model->path) - 1);
    model->path[sizeof(model->path) - 1] = '\0';
    model->loaded = true;
    model->version = 1;
    
    TN_LOG_INFO("Model loaded: %s from %s (size: %zu bytes)", model_name, model_path, model->size);
    
    return TN_INFER_SUCCESS;
}

int tn_infer_unload(tn_infer_t handle, const char *model_name)
{
    tn_model_info_t *model = nullptr;
    
    if (!handle || !model_name) {
        return TN_INFER_ERR_INVALID;
    }
    
    /* 查找模型 */
    for (int i = 0; i < handle->model_count; i++) {
        if (std::strcmp(handle->models[i].name, model_name) == 0) {
            model = &handle->models[i];
            break;
        }
    }
    
    if (!model || !model->loaded) {
        TN_LOG_WARN("Model not loaded: %s", model_name);
        return TN_INFER_ERR_NO_MODEL;
    }
    
    /* 卸载模型 */
    if (handle->loader) {
        tn_loader_unload(handle->loader, model_name);
    }
    
    model->loaded = false;
    
    TN_LOG_INFO("Model unloaded: %s", model_name);
    
    return TN_INFER_SUCCESS;
}

int tn_infer(tn_infer_t handle, tn_infer_request_t *request, tn_infer_result_t *result)
{
    uint64_t start_time, end_time;
    
    uk_pr_info("tn_infer: enter (handle=%p, request=%p, result=%p)\n",
               (void *)handle, (void *)request, (void *)result);

    if (!handle || !request || !result) {
        uk_pr_crit("tn_infer: invalid argument (handle=%p, request=%p, result=%p)\n",
                   (void *)handle, (void *)request, (void *)result);
        return TN_INFER_ERR_INVALID;
    }
    
    if (!handle->initialized) {
        uk_pr_crit("tn_infer: handle not initialized\n");
        return TN_INFER_ERR_INVALID;
    }
    
    /* 记录开始时间 */
    start_time = tn_get_time_us();
    
    /* 获取模型 */
    const char* model_name = request->model_name ? request->model_name : "default";
    uk_pr_info("tn_infer: using model_name=%s, input_size=%zu, output_size=%zu\n",
               model_name,
               (size_t)request->input_size,
               (size_t)request->output_size);
    void* model_ptr = tn_loader_get_model(handle->loader, model_name);
    if (!model_ptr) {
        result->error_code = TN_INFER_ERR_NO_MODEL;
        result->latency_us = tn_get_time_us() - start_time;
        uk_pr_crit("tn_infer: tn_loader_get_model returned NULL for model=%s\n",
                   model_name);
        return TN_INFER_ERR_NO_MODEL;
    }
    
    /* 转换为 MNNWrapper */
    tenon::inference::MNNWrapper* mnn = static_cast<tenon::inference::MNNWrapper*>(model_ptr);
    uk_pr_info("tn_infer: MNNWrapper pointer=%p\n", (void *)mnn);
    
    /* 获取输入张量 */
    MNN::Tensor* input_tensor = mnn->GetInputTensor(nullptr);
    if (!input_tensor) {
        result->error_code = TN_INFER_ERR_INVALID;
        result->latency_us = tn_get_time_us() - start_time;
        uk_pr_crit("tn_infer: GetInputTensor returned NULL\n");
        return TN_INFER_ERR_INVALID;
    }
    
    /* 准备输入数据 */
    /* 创建 host tensor 用于数据拷贝 */
    uk_pr_info("tn_infer: preparing input tensor\n");
    auto dim_type = input_tensor->getDimensionType();
    std::shared_ptr<MNN::Tensor> input_user(new MNN::Tensor(input_tensor, dim_type));
    
    /* 计算输入数据大小 */
    size_t input_element_size = input_tensor->elementSize();
    size_t input_bytes = input_element_size * sizeof(float);
    uk_pr_info("tn_infer: input_element_size=%zu, input_bytes=%zu\n",
               (size_t)input_element_size, (size_t)input_bytes);
    
    /* 检查输入大小 */
    if (request->input_size < input_bytes) {
        TN_LOG_ERROR("Input size mismatch: expected %zu, got %zu", input_bytes, request->input_size);
        result->error_code = TN_INFER_ERR_INVALID;
        result->latency_us = tn_get_time_us() - start_time;
        uk_pr_crit("tn_infer: input_size mismatch: expected=%zu, got=%zu\n",
                   (size_t)input_bytes, (size_t)request->input_size);
        return TN_INFER_ERR_INVALID;
    }
    
    /* 拷贝输入数据到 host tensor */
    if (request->input_data) {
        uk_pr_info("tn_infer: copying input data to host tensor\n");
        std::memcpy(input_user->host<float>(), request->input_data, input_bytes);
    }
    
    /* 拷贝 host tensor 到 device tensor */
    uk_pr_info("tn_infer: copying host tensor to device tensor\n");
    input_tensor->copyFromHostTensor(input_user.get());
    
    /* 执行推理 */
    uk_pr_info("tn_infer: about to call mnn->Run()\n");
    int ret = mnn->Run();
    uk_pr_info("tn_infer: mnn->Run() returned %d\n", ret);
    if (ret != 0) {
        result->error_code = TN_INFER_ERR_UNSUPPORTED;
        result->latency_us = tn_get_time_us() - start_time;
        uk_pr_crit("tn_infer: mnn->Run failed, ret=%d\n", ret);
        return TN_INFER_ERR_UNSUPPORTED;
    }
    
    /* 获取输出张量 */
    uk_pr_info("tn_infer: getting output tensor\n");
    MNN::Tensor* output_tensor = mnn->GetOutputTensor(nullptr);
    if (!output_tensor) {
        result->error_code = TN_INFER_ERR_INVALID;
        result->latency_us = tn_get_time_us() - start_time;
        uk_pr_crit("tn_infer: GetOutputTensor returned NULL\n");
        return TN_INFER_ERR_INVALID;
    }
    
    /* 创建 host tensor 用于输出数据 */
    uk_pr_info("tn_infer: creating host output tensor\n");
    auto output_dim_type = output_tensor->getDimensionType();
    std::shared_ptr<MNN::Tensor> output_user(new MNN::Tensor(output_tensor, output_dim_type));
    
    /* 从 device tensor 拷贝到 host tensor */
    uk_pr_info("tn_infer: copying device tensor to host tensor\n");
    output_tensor->copyToHostTensor(output_user.get());
    
    /* 计算输出大小 */
    size_t output_element_size = output_tensor->elementSize();
    size_t output_bytes = output_element_size * sizeof(float);
    uk_pr_info("tn_infer: output_element_size=%zu, output_bytes=%zu\n",
               (size_t)output_element_size, (size_t)output_bytes);
    
    /* 拷贝输出数据 */
    if (request->output_data && request->output_size >= output_bytes) {
        uk_pr_info("tn_infer: copying output to user buffer\n");
        std::memcpy(request->output_data, output_user->host<float>(), output_bytes);
        result->output_size = output_bytes;
    } else {
        result->output_size = output_bytes;
        if (request->output_size < output_bytes) {
            TN_LOG_WARN("Output buffer too small: %zu < %zu", request->output_size, output_bytes);
            uk_pr_warn("tn_infer: output buffer too small: provided=%zu, required=%zu\n",
                       (size_t)request->output_size, (size_t)output_bytes);
        }
    }
    
    result->error_code = TN_INFER_SUCCESS;
    
    /* 记录结束时间 */
    end_time = tn_get_time_us();
    result->latency_us = end_time - start_time;
    
    /* 更新指标 */
    if (handle->metrics && handle->config.metrics_enabled) {
        tn_metrics_record(handle->metrics, result->latency_us, 1, true);
    }
    
    return TN_INFER_SUCCESS;
}

int tn_infer_async(tn_infer_t handle, tn_infer_request_t *request)
{
    if (!handle || !request) {
        return TN_INFER_ERR_INVALID;
    }
    
    /* 提交到线程池 */
    if (handle->threadpool) {
        /* TODO: 实现异步任务提交 */
        return TN_INFER_ERR_UNSUPPORTED;
    }
    
    return TN_INFER_ERR_INVALID;
}

int tn_infer_get_metrics(tn_infer_t handle, tn_infer_metrics_t *metrics)
{
    if (!handle || !metrics) {
        return TN_INFER_ERR_INVALID;
    }
    
    if (handle->metrics) {
        tn_metrics_collect(handle->metrics, metrics);
    }
    
    /* 添加内存统计 */
    metrics->memory_used = handle->total_memory_used;
    metrics->memory_peak = handle->peak_memory_used;
    
    return TN_INFER_SUCCESS;
}

int tn_infer_list_models(tn_infer_t handle, tn_model_info_t *models, int max_count)
{
    int count = 0;
    
    if (!handle || !models) {
        return 0;
    }
    
    for (int i = 0; i < handle->model_count && count < max_count; i++) {
        models[count++] = handle->models[i];
    }
    
    return count;
}

int tn_infer_switch_version(tn_infer_t handle, const char *model_name, int version)
{
    (void)handle;
    (void)model_name;
    (void)version;
    
    /* TODO: 实现模型版本切换 */
    return TN_INFER_ERR_UNSUPPORTED;
}

int tn_infer_set_memory_limit(tn_infer_t handle, const char *model_name, size_t memory_limit)
{
    (void)handle;
    (void)model_name;
    (void)memory_limit;
    
    /* TODO: 实现内存配额设置 */
    return TN_INFER_ERR_UNSUPPORTED;
}

/* 获取当前时间(微秒) */
static uint64_t tn_get_time_us(void)
{
    /* 使用 TenonOS 的时间接口获取纳秒，然后转为微秒 */
    return static_cast<uint64_t>(ukplat_time_get_ticks() / 1000);
}

#ifdef __cplusplus
}
#endif
