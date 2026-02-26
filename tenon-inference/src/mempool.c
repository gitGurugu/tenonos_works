/*
 * TenonOS Inference Framework - Memory Pool Implementation
 */

#include "mempool.h"
#include "logger.h"
#include <uk/alloc.h>
#include <uk/print.h>
#include <string.h>

struct tn_mempool {
    size_t total_size;
    size_t used_size;
    size_t peak_size;
    void  *memory;
    struct uk_alloc *alloc;
};

tn_mempool_t *tn_mempool_create(size_t total_size)
{
    struct uk_alloc *a = uk_alloc_get_default();
    tn_mempool_t *pool;
    
    pool = uk_zalloc(a, sizeof(tn_mempool_t));
    if (!pool) {
        TN_LOG_ERROR("Failed to allocate memory pool");
        return NULL;
    }
    
    pool->memory = uk_malloc(a, total_size);
    if (!pool->memory) {
        TN_LOG_ERROR("Failed to allocate pool memory");
        uk_free(a, pool);
        return NULL;
    }
    
    pool->total_size = total_size;
    pool->used_size = 0;
    pool->peak_size = 0;
    pool->alloc = a;
    
    TN_LOG_INFO("Memory pool created: %zu bytes", total_size);
    
    return pool;
}

int tn_mempool_destroy(tn_mempool_t *pool)
{
    if (!pool) return -1;
    
    if (pool->memory) {
        uk_free(pool->alloc, pool->memory);
    }
    uk_free(pool->alloc, pool);
    
    TN_LOG_INFO("Memory pool destroyed");
    
    return 0;
}

void *tn_mempool_alloc(tn_mempool_t *pool, size_t size)
{
    void *ptr;
    
    if (!pool || size == 0) return NULL;
    
    if (pool->used_size + size > pool->total_size) {
        TN_LOG_ERROR("Memory pool exhausted");
        return NULL;
    }
    
    ptr = uk_malloc(pool->alloc, size);
    if (!ptr) return NULL;
    
    pool->used_size += size;
    if (pool->used_size > pool->peak_size) {
        pool->peak_size = pool->used_size;
    }
    
    return ptr;
}

int tn_mempool_free(tn_mempool_t *pool, void *ptr)
{
    (void)pool;
    (void)ptr;
    
    /* TODO: 实现内存释放追踪 */
    return 0;
}

int tn_mempool_get_stats(tn_mempool_t *pool, size_t *total, size_t *used, size_t *peak)
{
    if (!pool) return -1;
    
    if (total) *total = pool->total_size;
    if (used)  *used = pool->used_size;
    if (peak)  *peak = pool->peak_size;
    
    return 0;
}

