/*
 * TenonOS Inference Framework - Scheduler Header
 */

#ifndef TN_SCHEDULER_H
#define TN_SCHEDULER_H

#include <stdbool.h>

typedef struct tn_scheduler tn_scheduler_t;

/* 创建调度器 */
tn_scheduler_t *tn_scheduler_create(bool preemptive);

/* 销毁调度器 */
int tn_scheduler_destroy(tn_scheduler_t *scheduler);

/* 添加任务 */
int tn_scheduler_add_task(tn_scheduler_t *scheduler, void (*fn)(void *), void *arg, int priority);

/* 调度 */
void tn_scheduler_run(tn_scheduler_t *scheduler);

#endif /* TN_SCHEDULER_H */

