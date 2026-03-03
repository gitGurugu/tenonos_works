/*
 * TenonOS Inference Framework - Thread Pool Header (C++)
 */

#ifndef TN_THREADPOOL_HPP
#define TN_THREADPOOL_HPP

#include <cstdint>
#include <cstddef>
#include <uk/thread.h>

struct uk_alloc;

namespace tenon {
namespace inference {

/* 任务结构 */
struct Task {
    void (*fn)(void* arg);
    void* arg;
    int priority;
    uint64_t submit_time;
    Task* next;
    
    Task() : fn(nullptr), arg(nullptr), priority(0), submit_time(0), next(nullptr) {}
};

/* 线程池配置 */
struct ThreadPoolConfig {
    size_t thread_count;
    size_t queue_size;
    bool enable_priority;
    bool enable_preemptive;
    
    ThreadPoolConfig()
        : thread_count(4)
        , queue_size(256)
        , enable_priority(true)
        , enable_preemptive(true) {}
};

class ThreadPool {
public:
    explicit ThreadPool(const ThreadPoolConfig& config);
    ~ThreadPool();
    
    // 禁用拷贝，允许移动
    ThreadPool(const ThreadPool&) = delete;
    ThreadPool& operator=(const ThreadPool&) = delete;
    ThreadPool(ThreadPool&&) noexcept = delete;
    ThreadPool& operator=(ThreadPool&&) noexcept = delete;
    
    int Submit(void (*fn)(void*), void* arg, int priority);
    int Wait();
    int GetLoad(size_t* pending, size_t* running) const;
    
    bool IsValid() const { return workers_ != nullptr; }

private:
    ThreadPoolConfig config_;
    struct uk_thread** workers_;
    Task* task_queue_;
    Task* task_tail_;
    size_t pending_;
    size_t running_;
    size_t queue_capacity_;
    struct uk_alloc* alloc_;
    bool shutdown_;
    
    static void* WorkerThread(void* arg);
};

} // namespace inference
} // namespace tenon

#endif /* TN_THREADPOOL_HPP */
