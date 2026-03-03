/*
 * TenonOS Inference Framework - Scheduler Header (C++)
 */

#ifndef TN_SCHEDULER_HPP
#define TN_SCHEDULER_HPP

namespace tenon {
namespace inference {

class Scheduler {
public:
    explicit Scheduler(bool preemptive);
    ~Scheduler();
    
    // 禁用拷贝，允许移动
    Scheduler(const Scheduler&) = delete;
    Scheduler& operator=(const Scheduler&) = delete;
    Scheduler(Scheduler&&) noexcept = default;
    Scheduler& operator=(Scheduler&&) noexcept = default;
    
    int AddTask(void (*fn)(void*), void* arg, int priority);
    void Run();
    
    bool IsValid() const { return true; }

private:
    bool preemptive_;
};

} // namespace inference
} // namespace tenon

#endif /* TN_SCHEDULER_HPP */
