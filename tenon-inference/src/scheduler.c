/*
 * TenonOS Inference Framework - Scheduler Implementation
 */

#include "scheduler.h"
#include "logger.h"
#include <uk/alloc.h>
#include <uk/print.h>

struct tn_scheduler {
    bool preemptive;
    /* TODO: 集成 TenonOS 的 tnschedprio */
};

tn_scheduler_t *tn_scheduler_create(bool preemptive)
{
    tn_scheduler_t *scheduler;
    struct uk_alloc *a = uk_alloc_get_default();
    
    scheduler = uk_zalloc(a, sizeof(tn_scheduler_t));
    if (!scheduler) {
        TN_LOG_ERROR("Failed to allocate scheduler");
        return NULL;
    }
    
    scheduler->preemptive = preemptive;
    
    TN_LOG_INFO("Scheduler created (preemptive: %d)", preemptive);
    
    return scheduler;
}

int tn_scheduler_destroy(tn_scheduler_t *scheduler)
{
    struct uk_alloc *a = uk_alloc_get_default();
    
    if (!scheduler) return -1;
    
    uk_free(a, scheduler);
    
    TN_LOG_INFO("Scheduler destroyed");
    
    return 0;
}

int tn_scheduler_add_task(tn_scheduler_t *scheduler, void (*fn)(void *), void *arg, int priority)
{
    (void)scheduler;
    (void)fn;
    (void)arg;
    (void)priority;
    
    /* TODO: 集成 tnschedprio */
    return 0;
}

void tn_scheduler_run(tn_scheduler_t *scheduler)
{
    (void)scheduler;
    
    /* TODO: 调度循环 */
}
