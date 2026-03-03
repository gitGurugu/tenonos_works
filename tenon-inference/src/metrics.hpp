/*
 * TenonOS Inference Framework - Metrics Header (C++)
 */

#ifndef TN_METRICS_HPP
#define TN_METRICS_HPP

#include <cstdint>
#include <cstddef>
#include "api.hpp"

struct uk_alloc;

namespace tenon {
namespace inference {

struct MetricsSample {
    uint64_t timestamp_us;
    uint64_t latency_us;
    size_t batch_size;
    bool success;
    
    MetricsSample()
        : timestamp_us(0)
        , latency_us(0)
        , batch_size(0)
        , success(false) {}
};

class MetricsCollector {
public:
    explicit MetricsCollector(size_t history_size = 1024);
    ~MetricsCollector();
    
    // 禁用拷贝，允许移动
    MetricsCollector(const MetricsCollector&) = delete;
    MetricsCollector& operator=(const MetricsCollector&) = delete;
    MetricsCollector(MetricsCollector&&) noexcept;
    MetricsCollector& operator=(MetricsCollector&&) noexcept;
    
    void Record(uint64_t latency_us, size_t batch_size, bool success);
    void Collect(Metrics& out) const;
    
    bool IsValid() const { return samples_ != nullptr; }

private:
    MetricsSample* samples_;
    size_t history_size_;
    size_t head_;
    size_t count_;
    
    // 聚合统计
    uint64_t total_requests_;
    uint64_t success_count_;
    uint64_t error_count_;
    uint64_t latency_sum_;
    uint64_t latency_min_;
    uint64_t latency_max_;
    
    struct uk_alloc* alloc_;
};

} // namespace inference
} // namespace tenon

#endif /* TN_METRICS_HPP */
