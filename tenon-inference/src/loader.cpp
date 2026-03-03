/*
 * TenonOS Inference Framework - Model Loader Implementation (C++)
 */

#include "loader.hpp"
#include "mnn_wrapper.hpp"
#include "api.hpp"
#include "logger.hpp"
#include <uk/alloc.h>
#include <new>

namespace tenon {
namespace inference {

ModelLoader::ModelLoader(size_t max_model_size)
    : max_model_size_(max_model_size) {
    Logger::GetInstance().Info("Model loader created (max size: %zu MB)", max_model_size_ / (1024 * 1024));
}

ModelLoader::~ModelLoader() {
    // 自动清理所有模型
    models_.clear();
}

int ModelLoader::Load(const char* path, const char* name, int num_threads) {
    if (!path || !name) {
        Logger::GetInstance().Error("Invalid parameters for Load");
        return -1;
    }
    
    // 检查是否已加载
    if (models_.find(name) != models_.end()) {
        Logger::GetInstance().Warn("Model %s already loaded", name);
        return 0;
    }
    
    // 创建 MNN wrapper
    auto wrapper = std::make_unique<MNNWrapper>();
    
    // 从文件加载
    int ret = wrapper->LoadFromFile(path);
    if (ret != 0) {
        Logger::GetInstance().Error("Failed to load model %s from %s", name, path);
        return ret;
    }
    
    // 创建会话
    Logger::GetInstance().Info("Creating MNN session for model %s (threads: %d)", name, num_threads);
    ret = wrapper->CreateSession(num_threads);
    if (ret != 0) {
        Logger::GetInstance().Error("Failed to create session for model %s", name);
        return ret;
    }
    
    // 检查内存限制
    size_t model_size = wrapper->GetModelSize();
    if (model_size > max_model_size_) {
        Logger::GetInstance().Error("Model %s size (%zu) exceeds limit (%zu)", 
                                     name, model_size, max_model_size_);
        return -1;
    }
    
    // 保存到缓存
    models_[name] = std::move(wrapper);
    
    Logger::GetInstance().Info("Model %s loaded successfully (size: %zu bytes)", name, model_size);
    return 0;
}

int ModelLoader::Unload(const char* name) {
    if (!name) {
        return -1;
    }
    
    auto it = models_.find(name);
    if (it == models_.end()) {
        Logger::GetInstance().Warn("Model %s not found", name);
        return -1;
    }
    
    models_.erase(it);
    Logger::GetInstance().Info("Model %s unloaded", name);
    return 0;
}

MNNWrapper* ModelLoader::GetModel(const char* name) {
    if (!name) {
        return nullptr;
    }
    
    auto it = models_.find(name);
    if (it == models_.end()) {
        return nullptr;
    }
    
    return it->second.get();
}

size_t ModelLoader::GetTotalMemoryUsed() const {
    size_t total = 0;
    for (const auto& pair : models_) {
        total += pair.second->GetModelSize();
    }
    return total;
}

} // namespace inference
} // namespace tenon

/* C API 包装器 */
#ifdef __cplusplus
extern "C" {
#endif

struct tn_loader {
    tenon::inference::ModelLoader* impl;
};

tn_loader_t* tn_loader_create(size_t max_model_size) {
    tenon::inference::ModelLoader* loader = new(std::nothrow) tenon::inference::ModelLoader(max_model_size);
    if (!loader || !loader->IsValid()) {
        delete loader;
        return nullptr;
    }
    
    tn_loader_t* handle = static_cast<tn_loader_t*>(
        uk_zalloc(uk_alloc_get_default(), sizeof(struct tn_loader)));
    if (!handle) {
        delete loader;
        return nullptr;
    }
    
    handle->impl = loader;
    return handle;
}

int tn_loader_destroy(tn_loader_t *loader) {
    if (!loader) {
        return TN_INFER_ERR_INVALID;
    }
    
    delete loader->impl;
    uk_free(uk_alloc_get_default(), loader);
    
    return TN_INFER_SUCCESS;
}

int tn_loader_load(tn_loader_t *loader, const char *path, const char *name) {
    if (!loader || !path || !name) {
        return TN_INFER_ERR_INVALID;
    }
    
    // 使用默认线程数（4），可以通过配置获取
    int ret = loader->impl->Load(path, name, 4);
    return ret == 0 ? TN_INFER_SUCCESS : TN_INFER_ERR_LOAD_FAILED;
}

int tn_loader_unload(tn_loader_t *loader, const char *name) {
    if (!loader || !name) {
        return TN_INFER_ERR_INVALID;
    }
    
    int ret = loader->impl->Unload(name);
    return ret == 0 ? TN_INFER_SUCCESS : TN_INFER_ERR_NO_MODEL;
}

void* tn_loader_get_model(tn_loader_t *loader, const char *name) {
    if (!loader || !name) {
        return nullptr;
    }
    
    return static_cast<void*>(loader->impl->GetModel(name));
}

#ifdef __cplusplus
}
#endif
