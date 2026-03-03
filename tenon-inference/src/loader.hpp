/*
 * TenonOS Inference Framework - Model Loader Header (C++)
 */

#ifndef TN_LOADER_HPP
#define TN_LOADER_HPP

#include <cstddef>
#include <cstring>
#include <memory>
#include <string>
#include <map>

namespace tenon {
namespace inference {

class MNNWrapper;  // 前向声明

class ModelLoader {
public:
    explicit ModelLoader(size_t max_model_size);
    ~ModelLoader();
    
    // 禁用拷贝，允许移动
    ModelLoader(const ModelLoader&) = delete;
    ModelLoader& operator=(const ModelLoader&) = delete;
    ModelLoader(ModelLoader&&) noexcept = default;
    ModelLoader& operator=(ModelLoader&&) noexcept = default;
    
    int Load(const char* path, const char* name, int num_threads = 4);
    int Unload(const char* name);
    MNNWrapper* GetModel(const char* name);
    
    bool IsValid() const { return true; }
    
    // 获取已加载模型数量
    size_t GetModelCount() const { return models_.size(); }
    
    // 获取总内存使用
    size_t GetTotalMemoryUsed() const;

private:
    size_t max_model_size_;
    std::map<std::string, std::unique_ptr<MNNWrapper>> models_;
};

} // namespace inference
} // namespace tenon

#endif /* TN_LOADER_HPP */
