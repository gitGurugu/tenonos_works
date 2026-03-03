/*
 * TenonOS Inference Framework - Batch Processor Implementation (C++)
 */

#include "batch.hpp"
#include "api.hpp"
#include "logger.hpp"
#include <uk/alloc.h>
#include <cstring>
#include <new>

namespace tenon {
namespace inference {

BatchProcessor::BatchProcessor(const BatchConfig& config)
    : config_(config)
    , requests_(nullptr)
    , count_(0)
    , capacity_(config.max_batch_size)
    , alloc_(uk_alloc_get_default()) {
    
    requests_ = static_cast<void**>(
        uk_zalloc(alloc_, capacity_ * sizeof(void*)));
    if (!requests_) {
        Logger::GetInstance().Error("Failed to allocate batch requests array");
        return;
    }
    
    Logger::GetInstance().Info("Batch processor created (max: %zu, timeout: %zu us)",
                               config_.max_batch_size, config_.timeout_us);
}

BatchProcessor::~BatchProcessor() {
    if (requests_) {
        uk_free(alloc_, requests_);
    }
}

BatchProcessor::BatchProcessor(BatchProcessor&& other) noexcept
    : config_(other.config_)
    , requests_(other.requests_)
    , count_(other.count_)
    , capacity_(other.capacity_)
    , alloc_(other.alloc_) {
    other.requests_ = nullptr;
    other.count_ = 0;
    other.capacity_ = 0;
}

BatchProcessor& BatchProcessor::operator=(BatchProcessor&& other) noexcept {
    if (this != &other) {
        if (requests_) {
            uk_free(alloc_, requests_);
        }
        
        config_ = other.config_;
        requests_ = other.requests_;
        count_ = other.count_;
        capacity_ = other.capacity_;
        alloc_ = other.alloc_;
        
        other.requests_ = nullptr;
        other.count_ = 0;
        other.capacity_ = 0;
    }
    return *this;
}

int BatchProcessor::Add(void* request) {
    if (!requests_ || !request) {
        return -1;
    }
    if (count_ >= capacity_) {
        return -1;
    }
    
    requests_[count_++] = request;
    
    return 0;
}

void* BatchProcessor::Process() {
    // TODO: 实现批处理逻辑
    return nullptr;
}

} // namespace inference
} // namespace tenon

/* C API 包装器 */
#ifdef __cplusplus
extern "C" {
#endif

struct tn_batch {
    tenon::inference::BatchProcessor* impl;
};

tn_batch_t* tn_batch_create(const tn_batch_config_t *config) {
    if (!config) {
        return nullptr;
    }
    
    tenon::inference::BatchConfig cpp_config;
    cpp_config.max_batch_size = config->max_batch_size;
    cpp_config.timeout_us = config->timeout_us;
    
    tenon::inference::BatchProcessor* batch = new(std::nothrow) tenon::inference::BatchProcessor(cpp_config);
    if (!batch || !batch->IsValid()) {
        delete batch;
        return nullptr;
    }
    
    tn_batch_t* handle = static_cast<tn_batch_t*>(
        uk_zalloc(uk_alloc_get_default(), sizeof(struct tn_batch)));
    if (!handle) {
        delete batch;
        return nullptr;
    }
    
    handle->impl = batch;
    return handle;
}

int tn_batch_destroy(tn_batch_t *batch) {
    if (!batch) {
        return TN_INFER_ERR_INVALID;
    }
    
    delete batch->impl;
    uk_free(uk_alloc_get_default(), batch);
    
    return TN_INFER_SUCCESS;
}

int tn_batch_add(tn_batch_t *batch, void *request) {
    if (!batch) {
        return TN_INFER_ERR_INVALID;
    }
    
    return batch->impl->Add(request);
}

void* tn_batch_process(tn_batch_t *batch) {
    if (!batch) {
        return nullptr;
    }
    
    return batch->impl->Process();
}

#ifdef __cplusplus
}
#endif
