/*
 * TenonOS Inference Framework - Logger Header (C++)
 */

#ifndef TN_LOGGER_HPP
#define TN_LOGGER_HPP

#include <cstdio>
#include <cstdarg>
#include <cstring>

#ifdef __Unikraft__
#include <uk/print.h>
#endif

namespace tenon {
namespace inference {

/* 日志级别枚举 */
enum class LogLevel {
    ERROR = 0,
    WARN  = 1,
    INFO  = 2,
    DEBUG = 3
};

/* 日志类 - 单例模式 */
class Logger {
public:
    static Logger& GetInstance() {
        static Logger instance;
        return instance;
    }
    
    void Init(LogLevel level) {
        level_ = level;
#ifdef __Unikraft__
        uk_pr_info("\n");
        uk_pr_info("========================================\n");
        uk_pr_info("  Logger initialized (level: %d)\n", static_cast<int>(level));
        uk_pr_info("========================================\n");
#else
        printf("\n");
        printf("========================================\n");
        printf("  Logger initialized (level: %d)\n", static_cast<int>(level));
        printf("========================================\n");
#endif
    }
    
    void SetLevel(LogLevel level) {
        level_ = level;
    }
    
    LogLevel GetLevel() const {
        return level_;
    }
    
    void Error(const char* fmt, ...) const {
        if (level_ >= LogLevel::ERROR) {
            va_list args;
            va_start(args, fmt);
#ifdef __Unikraft__
            char buf[512];
            int len = vsnprintf(buf, sizeof(buf), fmt, args);
            if (len >= 0 && len < (int)sizeof(buf)) {
                uk_pr_err("%s", buf);
            } else {
                uk_pr_err("(message too long)");
            }
#else
            printf("[ERROR] ");
            vprintf(fmt, args);
            printf("\n");
#endif
            va_end(args);
        }
    }
    
    void Warn(const char* fmt, ...) const {
        if (level_ >= LogLevel::WARN) {
            va_list args;
            va_start(args, fmt);
#ifdef __Unikraft__
            char buf[512];
            int len = vsnprintf(buf, sizeof(buf), fmt, args);
            if (len >= 0 && len < (int)sizeof(buf)) {
                uk_pr_warn("%s", buf);
            } else {
                uk_pr_warn("(message too long)");
            }
#else
            printf("[WARN]  ");
            vprintf(fmt, args);
            printf("\n");
#endif
            va_end(args);
        }
    }
    
    void Info(const char* fmt, ...) const {
        if (level_ >= LogLevel::INFO) {
            va_list args;
            va_start(args, fmt);
#ifdef __Unikraft__
            char buf[512];
            int len = vsnprintf(buf, sizeof(buf), fmt, args);
            if (len >= 0 && len < (int)sizeof(buf)) {
                uk_pr_info("%s", buf);
            } else {
                uk_pr_info("(message too long)");
            }
#else
            printf("[INFO]  ");
            vprintf(fmt, args);
            printf("\n");
#endif
            va_end(args);
        }
    }
    
    void Debug(const char* fmt, ...) const {
        if (level_ >= LogLevel::DEBUG) {
            va_list args;
            va_start(args, fmt);
#ifdef __Unikraft__
            char buf[512];
            int len = vsnprintf(buf, sizeof(buf), fmt, args);
            if (len >= 0 && len < (int)sizeof(buf)) {
                uk_pr_info("%s", buf);
            } else {
                uk_pr_info("(message too long)");
            }
#else
            printf("[DEBUG] ");
            vprintf(fmt, args);
            printf("\n");
#endif
            va_end(args);
        }
    }

private:
    Logger() : level_(LogLevel::INFO) {}
    ~Logger() = default;
    Logger(const Logger&) = delete;
    Logger& operator=(const Logger&) = delete;
    
    LogLevel level_;
};

} // namespace inference
} // namespace tenon

#endif /* TN_LOGGER_HPP */
