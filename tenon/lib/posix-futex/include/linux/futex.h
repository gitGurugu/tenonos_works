/*
 * SPDX-License-Identifier: Apache-2.0
 * Copyright 2024 The TenonOS Authors
 */
#ifndef __UK_UK_FUTEX_H__
#define __UK_UK_FUTEX_H__

/* Second argument to futex syscall which is compatible with linux*/

#define UK_FUTEX_WAIT 0
#define UK_FUTEX_WAKE 1
#define UK_FUTEX_FD 2
#define UK_FUTEX_REQUEUE 3
#define UK_FUTEX_CMP_REQUEUE 4
#define UK_FUTEX_WAKE_OP 5
#define UK_FUTEX_LOCK_PI 6
#define UK_FUTEX_UNLOCK_PI 7
#define UK_FUTEX_TRYLOCK_PI 8
#define UK_FUTEX_WAIT_BITSET 9
#define UK_FUTEX_WAKE_BITSET 10
#define UK_FUTEX_WAIT_REQUEUE_PI 11
#define UK_FUTEX_CMP_REQUEUE_PI 12
#define UK_FUTEX_LOCK_PI2 13

#define UK_FUTEX_PRIVATE_FLAG 128
#define UK_FUTEX_CLOCK_REALTIME 256
#define UK_FUTEX_CMD_MASK ~(UK_FUTEX_PRIVATE_FLAG | UK_FUTEX_CLOCK_REALTIME)

#define UK_FUTEX_WAIT_PRIVATE (UK_FUTEX_WAIT | UK_FUTEX_PRIVATE_FLAG)
#define UK_FUTEX_WAKE_PRIVATE (UK_FUTEX_WAKE | UK_FUTEX_PRIVATE_FLAG)

/* Compatibility macros for standard Linux futex constants */
#ifndef FUTEX_WAIT_PRIVATE
#define FUTEX_WAIT_PRIVATE UK_FUTEX_WAIT_PRIVATE
#endif

#ifndef FUTEX_WAKE_PRIVATE
#define FUTEX_WAKE_PRIVATE UK_FUTEX_WAKE_PRIVATE
#endif

#endif /* __UK_UK_FUTEX_H__ */
