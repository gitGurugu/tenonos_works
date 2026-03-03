/*
 * TenonOS Inference Framework - Batch Processor Header (C++)
 */

#ifndef TN_BATCH_HPP
#define TN_BATCH_HPP

#include <cstddef>

struct uk_alloc;

namespace tenon {
namespace inference {

struct BatchConfig {
    size_t max_batch_size;
    size_t timeout_us;
    
    BatchConfig()
        : max_batch_size(8)
        , timeout_us(1000) {}
};

class BatchProcessor {
public:
    explicit BatchProcessor(const BatchConfig& config);
    ~BatchProcessor();
    
    // 禁用拷贝，允许移动
    BatchProcessor(const BatchProcessor&) = delete;
    BatchProcessor& operator=(const BatchProcessor&) = delete;
    BatchProcessor(BatchProcessor&&) noexcept;
    BatchProcessor& operator=(BatchProcessor&&) noexcept;
    
    int Add(void* request);
    void* Process();
    
    bool IsValid() const { return requests_ != nullptr; }

private:
    BatchConfig config_;
    void** requests_;
    size_t count_;
    size_t capacity_;
    struct uk_alloc* alloc_;
};

} // namespace inference
} // namespace tenon

#endif /* TN_BATCH_HPP */
