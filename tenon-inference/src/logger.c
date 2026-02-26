/*
 * TenonOS Inference Framework - Logger Implementation
 */

#include "logger.h"

int g_log_level = TN_LOG_LEVEL_INFO;

void tn_logger_init(int level)
{
    g_log_level = level;
    
    printf("\n");
    printf("========================================\n");
    printf("  Logger initialized (level: %d)\n", level);
    printf("========================================\n");
}

