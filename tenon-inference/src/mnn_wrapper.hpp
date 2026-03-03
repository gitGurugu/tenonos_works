/*
 * TenonOS Inference Framework - MNN Wrapper Header (C++)
 */

#ifndef TN_MNN_WRAPPER_HPP
#define TN_MNN_WRAPPER_HPP

#include <MNN/Interpreter.hpp>
#include <MNN/Tensor.hpp>
#include <memory>
#include <string>
#include <vector>
#include <map>

namespace tenon {
namespace inference {

class MNNWrapper {
public:
    MNNWrapper();
    ~MNNWrapper();
    
    // 禁用拷贝，允许移动
    MNNWrapper(const MNNWrapper&) = delete;
    MNNWrapper& operator=(const MNNWrapper&) = delete;
    MNNWrapper(MNNWrapper&&) noexcept = default;
    MNNWrapper& operator=(MNNWrapper&&) noexcept = default;
    
    // 从文件加载模型
    int LoadFromFile(const char* path);
    
    // 从内存加载模型
    int LoadFromBuffer(const void* buffer, size_t size);
    
    // 创建会话
    int CreateSession(int num_threads = 4);
    
    // 获取输入张量（返回的指针由 Session 管理，不需要手动释放）
    MNN::Tensor* GetInputTensor(const char* name = nullptr);
    
    // 获取输出张量（返回的指针由 Session 管理，不需要手动释放）
    MNN::Tensor* GetOutputTensor(const char* name = nullptr);
    
    // 获取所有输入/输出张量
    const std::map<std::string, MNN::Tensor*>& GetInputTensors() const;
    const std::map<std::string, MNN::Tensor*>& GetOutputTensors() const;
    
    // 调整输入张量大小
    int ResizeInput(const char* name, const std::vector<int>& dims);
    
    // 调整会话（在修改输入张量大小后必须调用）
    int ResizeSession();
    
    // 执行推理
    int Run();
    
    // 获取输入输出数量
    int GetInputCount() const;
    int GetOutputCount() const;
    
    // 检查是否有效
    bool IsValid() const { return interpreter_ != nullptr && session_ != nullptr; }
    
    // 获取 Interpreter 指针（用于高级操作）
    MNN::Interpreter* GetInterpreter() const { return interpreter_.get(); }
    
    // 获取 Session 指针（用于高级操作）
    MNN::Session* GetSession() const { return session_; }
    
    // 获取模型大小（字节）
    size_t GetModelSize() const { return model_size_; }
    
    // 设置模型大小（用于从文件加载时）
    void SetModelSize(size_t size) { model_size_ = size; }

private:
    // 使用 shared_ptr 管理 Interpreter，配合自定义删除器
    std::shared_ptr<MNN::Interpreter> interpreter_;
    MNN::Session* session_;  // Session 由 Interpreter 管理
    size_t model_size_;
    
    // 自定义删除器
    struct InterpreterDeleter {
        void operator()(MNN::Interpreter* ptr) const {
            if (ptr) {
                MNN::Interpreter::destroy(ptr);
            }
        }
    };
};

} // namespace inference
} // namespace tenon

#endif /* TN_MNN_WRAPPER_HPP */
