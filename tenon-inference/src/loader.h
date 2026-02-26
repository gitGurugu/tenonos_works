/*
 * TenonOS Inference Framework - Model Loader Header
 */

#ifndef TN_LOADER_H
#define TN_LOADER_H

#include <stddef.h>

typedef struct tn_loader tn_loader_t;

tn_loader_t *tn_loader_create(size_t max_model_size);
int tn_loader_destroy(tn_loader_t *loader);
int tn_loader_load(tn_loader_t *loader, const char *path, const char *name);
int tn_loader_unload(tn_loader_t *loader, const char *name);
void *tn_loader_get_model(tn_loader_t *loader, const char *name);

#endif /* TN_LOADER_H */

