/*
 * TenonOS Inference Framework - Thread Pool Header
 */

#ifndef TN_THREADPOOL_H
#define TN_THREADPOOL_H

#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

/* 任务结构 */
typedef struct tn_task {
    void (*fn)(void *arg);       /* 任务函数 */
    void *arg;                   /* 任务参数 */
    int priority;                /* 任务优先级 */
    uint64_t submit_time;        /* 提交时间 */
    struct tn_task *next;        /* 链表 next */
} tn_task_t;

/* 线程池句柄 */
typedef struct tn_threadpool tn_threadpool_t;

/* 线程池配置 */
typedef struct {
    size_t thread_count;         /* 线程数 */
    size_t queue_size;           /* 队列大小 */
    bool   enable_priority;      /* 启用优先级 */
    bool   enable_preemptive;    /* 启用抢占 */
} tn_threadpool_config_t;

/* 创建线程池 */
tn_threadpool_t *tn_threadpool_create(const tn_threadpool_config_t *config);

/* 销毁线程池 */
int tn_threadpool_destroy(tn_threadpool_t *pool);

/* 提交任务 */
int tn_threadpool_submit(tn_threadpool_t *pool, void (*fn)(void *), void *arg, int priority);

/* 等待所有任务完成 */
int tn_threadpool_wait(tn_threadpool_t *pool);

/* 获取当前负载 */
int tn_threadpool_get_load(tn_threadpool_t *pool, size_t *pending, size_t *running);

#endif /* TN_THREADPOOL_H */

