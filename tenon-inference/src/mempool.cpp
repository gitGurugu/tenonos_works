/*
 * TenonOS Inference Framework - Memory Pool Implementation (C++)
 */

#include "mempool.hpp"
#include "api.hpp"
#include "logger.hpp"
#include <new>

namespace tenon {
namespace inference {

MemoryPool::MemoryPool(size_t total_size)
    : total_size_(total_size)
    , used_size_(0)
    , peak_size_(0)
    , memory_(nullptr)
    , alloc_(uk_alloc_get_default()) {
    
    memory_ = uk_malloc(alloc_, total_size_);
    if (!memory_) {
        Logger::GetInstance().Error("Failed to allocate pool memory");
        return;
    }
    
    Logger::GetInstance().Info("Memory pool created: %zu bytes", total_size_);
}

MemoryPool::~MemoryPool() {
    if (memory_) {
        uk_free(alloc_, memory_);
    }
    Logger::GetInstance().Info("Memory pool destroyed");
}

MemoryPool::MemoryPool(MemoryPool&& other) noexcept
    : total_size_(other.total_size_)
    , used_size_(other.used_size_)
    , peak_size_(other.peak_size_)
    , memory_(other.memory_)
    , alloc_(other.alloc_) {
    other.memory_ = nullptr;
    other.total_size_ = 0;
    other.used_size_ = 0;
    other.peak_size_ = 0;
}

MemoryPool& MemoryPool::operator=(MemoryPool&& other) noexcept {
    if (this != &other) {
        if (memory_) {
            uk_free(alloc_, memory_);
        }
        
        total_size_ = other.total_size_;
        used_size_ = other.used_size_;
        peak_size_ = other.peak_size_;
        memory_ = other.memory_;
        alloc_ = other.alloc_;
        
        other.memory_ = nullptr;
        other.total_size_ = 0;
        other.used_size_ = 0;
        other.peak_size_ = 0;
    }
    return *this;
}

void* MemoryPool::Alloc(size_t size) {
    if (!memory_ || size == 0) {
        return nullptr;
    }
    
    if (used_size_ + size > total_size_) {
        Logger::GetInstance().Error("Memory pool exhausted");
        return nullptr;
    }
    
    void* ptr = uk_malloc(alloc_, size);
    if (!ptr) {
        return nullptr;
    }
    
    used_size_ += size;
    if (used_size_ > peak_size_) {
        peak_size_ = used_size_;
    }
    
    return ptr;
}

int MemoryPool::Free(void* ptr) {
    (void)ptr;
    // TODO: 实现内存释放追踪
    return 0;
}

int MemoryPool::GetStats(size_t* total, size_t* used, size_t* peak) const {
    if (!total && !used && !peak) {
        return -1;
    }
    
    if (total) *total = total_size_;
    if (used)  *used = used_size_;
    if (peak)  *peak = peak_size_;
    
    return 0;
}

} // namespace inference
} // namespace tenon

/* C API 包装器 */
#ifdef __cplusplus
extern "C" {
#endif

struct tn_mempool {
    tenon::inference::MemoryPool* impl;
};

tn_mempool_t* tn_mempool_create(size_t total_size) {
    tenon::inference::MemoryPool* pool = new(std::nothrow) tenon::inference::MemoryPool(total_size);
    if (!pool || !pool->IsValid()) {
        delete pool;
        return nullptr;
    }
    
    tn_mempool_t* handle = static_cast<tn_mempool_t*>(
        uk_zalloc(uk_alloc_get_default(), sizeof(struct tn_mempool)));
    if (!handle) {
        delete pool;
        return nullptr;
    }
    
    handle->impl = pool;
    return handle;
}

int tn_mempool_destroy(tn_mempool_t *pool) {
    if (!pool) {
        return TN_INFER_ERR_INVALID;
    }
    
    delete pool->impl;
    uk_free(uk_alloc_get_default(), pool);
    
    return TN_INFER_SUCCESS;
}

void* tn_mempool_alloc(tn_mempool_t *pool, size_t size) {
    if (!pool) {
        return nullptr;
    }
    
    return pool->impl->Alloc(size);
}

int tn_mempool_free(tn_mempool_t *pool, void *ptr) {
    if (!pool) {
        return TN_INFER_ERR_INVALID;
    }
    
    return pool->impl->Free(ptr);
}

#ifdef __cplusplus
}
#endif
