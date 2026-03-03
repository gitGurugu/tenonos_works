/*
 * TenonOS Inference Framework - Memory Pool Header (C++)
 */

#ifndef TN_MEMPOOL_HPP
#define TN_MEMPOOL_HPP

#include <cstddef>
#include <cstdint>
#include <uk/alloc.h>

namespace tenon {
namespace inference {

class MemoryPool {
public:
    explicit MemoryPool(size_t total_size);
    ~MemoryPool();
    
    // 禁用拷贝，允许移动
    MemoryPool(const MemoryPool&) = delete;
    MemoryPool& operator=(const MemoryPool&) = delete;
    MemoryPool(MemoryPool&&) noexcept;
    MemoryPool& operator=(MemoryPool&&) noexcept;
    
    void* Alloc(size_t size);
    int Free(void* ptr);
    
    int GetStats(size_t* total, size_t* used, size_t* peak) const;
    
    bool IsValid() const { return memory_ != nullptr; }
    
    size_t GetTotalSize() const { return total_size_; }
    size_t GetUsedSize() const { return used_size_; }
    size_t GetPeakSize() const { return peak_size_; }

private:
    size_t total_size_;
    size_t used_size_;
    size_t peak_size_;
    void* memory_;
    struct uk_alloc* alloc_;
};

} // namespace inference
} // namespace tenon

#endif /* TN_MEMPOOL_HPP */
