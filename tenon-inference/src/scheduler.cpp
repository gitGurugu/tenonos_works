/*
 * TenonOS Inference Framework - Scheduler Implementation (C++)
 */

#include "scheduler.hpp"
#include "api.hpp"
#include "logger.hpp"
#include <new>
#include <uk/alloc.h>

namespace tenon {
namespace inference {

Scheduler::Scheduler(bool preemptive)
    : preemptive_(preemptive) {
    Logger::GetInstance().Info("Scheduler created (preemptive: %d)", preemptive);
}

Scheduler::~Scheduler() {
    Logger::GetInstance().Info("Scheduler destroyed");
}

int Scheduler::AddTask(void (*fn)(void*), void* arg, int priority) {
    (void)fn;
    (void)arg;
    (void)priority;
    
    // TODO: 集成 tnschedprio
    return 0;
}

void Scheduler::Run() {
    // TODO: 调度循环
}

} // namespace inference
} // namespace tenon

/* C API 包装器 */
#ifdef __cplusplus
extern "C" {
#endif

struct tn_scheduler {
    tenon::inference::Scheduler* impl;
};

tn_scheduler_t* tn_scheduler_create(bool preemptive) {
    tenon::inference::Scheduler* scheduler = new(std::nothrow) tenon::inference::Scheduler(preemptive);
    if (!scheduler || !scheduler->IsValid()) {
        delete scheduler;
        return nullptr;
    }
    
    tn_scheduler_t* handle = static_cast<tn_scheduler_t*>(
        uk_zalloc(uk_alloc_get_default(), sizeof(struct tn_scheduler)));
    if (!handle) {
        delete scheduler;
        return nullptr;
    }
    
    handle->impl = scheduler;
    return handle;
}

int tn_scheduler_destroy(tn_scheduler_t *scheduler) {
    if (!scheduler) {
        return TN_INFER_ERR_INVALID;
    }
    
    delete scheduler->impl;
    uk_free(uk_alloc_get_default(), scheduler);
    
    return TN_INFER_SUCCESS;
}

int tn_scheduler_add_task(tn_scheduler_t *scheduler, void (*fn)(void*), void *arg, int priority) {
    if (!scheduler || !fn) {
        return TN_INFER_ERR_INVALID;
    }
    
    return scheduler->impl->AddTask(fn, arg, priority);
}

#ifdef __cplusplus
}
#endif
