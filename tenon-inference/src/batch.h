/*
 * TenonOS Inference Framework - Batch Processor Header
 */

#ifndef TN_BATCH_H
#define TN_BATCH_H

#include <stddef.h>
#include <stdbool.h>

typedef struct tn_batch tn_batch_t;

typedef struct {
    size_t max_batch_size;
    size_t timeout_us;
} tn_batch_config_t;

tn_batch_t *tn_batch_create(const tn_batch_config_t *config);
int tn_batch_destroy(tn_batch_t *batch);
int tn_batch_add(tn_batch_t *batch, void *request);
void *tn_batch_process(tn_batch_t *batch);

#endif /* TN_BATCH_H */

