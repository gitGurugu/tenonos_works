/*
 * TenonOS Inference Framework - Logger Header
 */

#ifndef TN_LOGGER_H
#define TN_LOGGER_H

#include <stdio.h>

/* 日志级别常量 */
#define TN_LOG_LEVEL_ERROR   0
#define TN_LOG_LEVEL_WARN    1
#define TN_LOG_LEVEL_INFO    2
#define TN_LOG_LEVEL_DEBUG   3

/* 初始化日志 */
void tn_logger_init(int level);

/* 日志宏 - 使用 _LEVEL 后缀的常量来避免冲突 */
#define TN_LOG_ERROR(fmt, ...) do { if (g_log_level >= TN_LOG_LEVEL_ERROR) printf("[ERROR] " fmt "\n", ##__VA_ARGS__); } while(0)
#define TN_LOG_WARN(fmt, ...)  do { if (g_log_level >= TN_LOG_LEVEL_WARN)  printf("[WARN]  " fmt "\n", ##__VA_ARGS__); } while(0)
#define TN_LOG_INFO(fmt, ...)  do { if (g_log_level >= TN_LOG_LEVEL_INFO)  printf("[INFO]  " fmt "\n", ##__VA_ARGS__); } while(0)
#define TN_LOG_DEBUG(fmt, ...) do { if (g_log_level >= TN_LOG_LEVEL_DEBUG) printf("[DEBUG] " fmt "\n", ##__VA_ARGS__); } while(0)

/* 全局日志级别 */
extern int g_log_level;

#endif /* TN_LOGGER_H */
