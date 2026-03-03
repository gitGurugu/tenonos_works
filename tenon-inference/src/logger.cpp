/*
 * TenonOS Inference Framework - Logger Implementation (C++)
 */

#include "logger.hpp"
#include "api.hpp"

#ifdef __Unikraft__
#include <uk/print.h>
#endif

using tenon::inference::Logger;
using tenon::inference::LogLevel;

#ifdef __cplusplus
extern "C" {
#endif

int g_log_level = TN_LOG_LEVEL_INFO;

static LogLevel tn_map_level(int level)
{
    if (level <= 0)
        return LogLevel::ERROR;
    if (level == 1)
        return LogLevel::WARN;
    if (level == 2)
        return LogLevel::INFO;
    return LogLevel::DEBUG;
}

void tn_logger_init(int level)
{
    /* Clamp to valid range [0, 3] */
    if (level < 0)
        level = 0;
    if (level > 3)
        level = 3;

    g_log_level = level;

    /* Sync C++ Logger (used by MNN/loader) with configured level */
    Logger::GetInstance().Init(tn_map_level(level));
    
#ifdef __Unikraft__
    uk_pr_info("\n");
    uk_pr_info("========================================\n");
    uk_pr_info("  Logger initialized (level: %d)\n", level);
    uk_pr_info("========================================\n");
#else
    printf("\n");
    printf("========================================\n");
    printf("  Logger initialized (level: %d)\n", level);
    printf("========================================\n");
#endif
}

#ifdef __cplusplus
}
#endif

