/*
 * TenonOS Inference Framework - Metrics Header
 */

#ifndef TN_METRICS_H
#define TN_METRICS_H

#include <stdint.h>
#include <stddef.h>
#include "api.h"

#define METRICS_HISTORY_SIZE 1024

typedef struct {
    uint64_t timestamp_us;
    uint64_t latency_us;
    size_t   batch_size;
    bool     success;
} metrics_sample_t;

typedef struct tn_metrics tn_metrics_t;

tn_metrics_t *tn_metrics_create(size_t history_size);
int tn_metrics_destroy(tn_metrics_t *metrics);
void tn_metrics_record(tn_metrics_t *metrics, uint64_t latency_us, size_t batch_size, bool success);
void tn_metrics_collect(tn_metrics_t *metrics, tn_infer_metrics_t *out);

#endif /* TN_METRICS_H */

