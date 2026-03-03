/*
 * TenonOS Inference Framework - MNN Wrapper Implementation (C++)
 */

#include "mnn_wrapper.hpp"
#include "logger.hpp"
#include <MNN/MNNForwardType.h>
#include <MNN/ErrorCode.hpp>
#include <cstring>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>

namespace tenon {
namespace inference {

MNNWrapper::MNNWrapper() 
    : interpreter_(nullptr, InterpreterDeleter()), session_(nullptr), model_size_(0) {
}

MNNWrapper::~MNNWrapper() {
    // Session 由 Interpreter 管理，会自动释放
    if (interpreter_ && session_) {
        interpreter_->releaseSession(session_);
        session_ = nullptr;
    }
    // Interpreter 由 shared_ptr 管理，会自动释放
}

int MNNWrapper::LoadFromFile(const char* path) {
    if (!path) {
        Logger::GetInstance().Error("MNN: Invalid file path");
        return -1;
    }
    
    // 获取文件大小
    struct stat st;
    if (stat(path, &st) != 0) {
        Logger::GetInstance().Error("MNN: Failed to stat file: %s", path);
        return -1;
    }
    model_size_ = static_cast<size_t>(st.st_size);
    
    // 使用 shared_ptr 配合自定义删除器管理 Interpreter
    MNN::Interpreter* net = MNN::Interpreter::createFromFile(path);
    if (!net) {
        Logger::GetInstance().Error("MNN: Failed to load model from file: %s", path);
        return -1;
    }
    
    interpreter_.reset(net, InterpreterDeleter());
    
    Logger::GetInstance().Info("MNN: Model loaded from file: %s (size: %zu bytes)", path, model_size_);
    return 0;
}

int MNNWrapper::LoadFromBuffer(const void* buffer, size_t size) {
    if (!buffer || size == 0) {
        Logger::GetInstance().Error("MNN: Invalid buffer");
        return -1;
    }
    
    // 使用 shared_ptr 配合自定义删除器管理 Interpreter
    MNN::Interpreter* net = MNN::Interpreter::createFromBuffer(buffer, size);
    if (!net) {
        Logger::GetInstance().Error("MNN: Failed to load model from buffer");
        return -1;
    }
    
    interpreter_.reset(net, InterpreterDeleter());
    model_size_ = size;
    
    Logger::GetInstance().Info("MNN: Model loaded from buffer (size: %zu bytes)", size);
    return 0;
}

int MNNWrapper::CreateSession(int num_threads) {
    if (!interpreter_) {
        Logger::GetInstance().Error("MNN: Interpreter not initialized");
        return -1;
    }
    
    MNN::ScheduleConfig config;
    config.type = MNN_FORWARD_CPU;
    config.numThread = num_threads;
    
    session_ = interpreter_->createSession(config);
    if (!session_) {
        Logger::GetInstance().Error("MNN: Failed to create session");
        return -1;
    }
    
    // 获取输入输出数量
    auto input_tensors = interpreter_->getSessionInputAll(session_);
    auto output_tensors = interpreter_->getSessionOutputAll(session_);
    
    Logger::GetInstance().Info("MNN: Session created (threads: %d, inputs: %zu, outputs: %zu)",
                                num_threads, input_tensors.size(), output_tensors.size());
    
    return 0;
}

MNN::Tensor* MNNWrapper::GetInputTensor(const char* name) {
    if (!session_ || !interpreter_) {
        return nullptr;
    }
    
    return interpreter_->getSessionInput(session_, name);
}

MNN::Tensor* MNNWrapper::GetOutputTensor(const char* name) {
    if (!session_ || !interpreter_) {
        return nullptr;
    }
    
    return interpreter_->getSessionOutput(session_, name);
}

const std::map<std::string, MNN::Tensor*>& MNNWrapper::GetInputTensors() const {
    static std::map<std::string, MNN::Tensor*> empty;
    if (!session_ || !interpreter_) {
        return empty;
    }
    return interpreter_->getSessionInputAll(session_);
}

const std::map<std::string, MNN::Tensor*>& MNNWrapper::GetOutputTensors() const {
    static std::map<std::string, MNN::Tensor*> empty;
    if (!session_ || !interpreter_) {
        return empty;
    }
    return interpreter_->getSessionOutputAll(session_);
}

int MNNWrapper::ResizeInput(const char* name, const std::vector<int>& dims) {
    if (!session_ || !interpreter_) {
        return -1;
    }
    
    MNN::Tensor* tensor = interpreter_->getSessionInput(session_, name);
    if (!tensor) {
        Logger::GetInstance().Error("MNN: Input tensor not found: %s", name ? name : "default");
        return -1;
    }
    
    interpreter_->resizeTensor(tensor, dims);
    return 0;
}

int MNNWrapper::ResizeSession() {
    if (!session_ || !interpreter_) {
        return -1;
    }
    
    interpreter_->resizeSession(session_);
    return 0;
}

int MNNWrapper::Run() {
    if (!session_ || !interpreter_) {
        Logger::GetInstance().Error("MNN: Session or Interpreter not initialized");
        return -1;
    }
    
    MNN::ErrorCode error = interpreter_->runSession(session_);
    if (error != MNN::NO_ERROR) {
        Logger::GetInstance().Error("MNN: Run session failed with error code: %d", static_cast<int>(error));
        return -1;
    }
    
    return 0;
}

int MNNWrapper::GetInputCount() const {
    if (!session_ || !interpreter_) {
        return 0;
    }
    
    auto inputs = interpreter_->getSessionInputAll(session_);
    return static_cast<int>(inputs.size());
}

int MNNWrapper::GetOutputCount() const {
    if (!session_ || !interpreter_) {
        return 0;
    }
    
    auto outputs = interpreter_->getSessionOutputAll(session_);
    return static_cast<int>(outputs.size());
}

} // namespace inference
} // namespace tenon
