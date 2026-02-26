/*
 * TenonOS Inference Framework - Model Loader Implementation
 */

#include "loader.h"
#include "logger.h"
#include <uk/alloc.h>
#include <uk/print.h>
#include <string.h>

struct tn_loader {
    size_t max_model_size;
    /* TODO: 添加模型缓存管理 */
};

tn_loader_t *tn_loader_create(size_t max_model_size)
{
    tn_loader_t *loader;
    
    loader = uk_zalloc(uk_alloc_get_default(), sizeof(tn_loader_t));
    if (!loader) return NULL;
    
    loader->max_model_size = max_model_size;
    
    TN_LOG_INFO("Model loader created (max size: %zu)", max_model_size);
    
    return loader;
}

int tn_loader_destroy(tn_loader_t *loader)
{
    if (!loader) return -1;
    
    uk_free(uk_alloc_get_default(), loader);
    
    return 0;
}

int tn_loader_load(tn_loader_t *loader, const char *path, const char *name)
{
    (void)loader;
    (void)path;
    (void)name;
    
    TN_LOG_INFO("Loading model: %s from %s", name, path);
    
    /* TODO: 实现模型加载逻辑 */
    /* 1. 读取模型文件 */
    /* 2. 解析模型格式 */
    /* 3. 加载到内存 */
    
    return 0;
}

int tn_loader_unload(tn_loader_t *loader, const char *name)
{
    (void)loader;
    (void)name;
    
    TN_LOG_INFO("Unloading model: %s", name);
    
    /* TODO: 实现模型卸载 */
    
    return 0;
}

void *tn_loader_get_model(tn_loader_t *loader, const char *name)
{
    (void)loader;
    (void)name;
    
    /* TODO: 返回模型指针 */
    return NULL;
}

