/*
 * TenonOS Inference Framework - Memory Pool Header
 */

#ifndef TN_MEMPOOL_H
#define TN_MEMPOOL_H

#include <stddef.h>
#include <stdint.h>

typedef struct tn_mempool tn_mempool_t;

/* 创建内存池 */
tn_mempool_t *tn_mempool_create(size_t total_size);

/* 销毁内存池 */
int tn_mempool_destroy(tn_mempool_t *pool);

/* 分配内存 */
void *tn_mempool_alloc(tn_mempool_t *pool, size_t size);

/* 释放内存 */
int tn_mempool_free(tn_mempool_t *pool, void *ptr);

/* 获取内存池状态 */
int tn_mempool_get_stats(tn_mempool_t *pool, size_t *total, size_t *used, size_t *peak);

#endif /* TN_MEMPOOL_H */

