/*
 * SPDX-License-Identifier: Apache-2.0
 * Copyright 2024 The TenonOS Authors
 */

#ifndef __TN_DEVICE_H__
#define __TN_DEVICE_H__

#ifdef __cplusplus
extern "C" {
#endif
/*
 * Device object
 */
#define MAXDEVNAME 12

struct device {
	/* Pointer to the driver object */
	struct driver *driver;
	/* Name of device */
	char name[MAXDEVNAME];
	/* D_* flags defined above */
	int flags;
	/* Status of the device (1 if active, 0 if inactive) */
	int state;
	/* Private storage */
	void *private_data;
};

#ifdef __cplusplus
}
#endif

#endif /* __TN__DEVICE_H__ */
