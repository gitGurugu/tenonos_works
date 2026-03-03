/* SPDX-License-Identifier: Apache-2.0 */
/*
 * TenonOS Inference Framework - Minimal Hello World Test
 *
 * This version is simplified to only print a hello message,
 * to verify that basic stdout / console output works end‑to‑end.
 */

#include <cstdio>

/* Import user configuration */
#ifdef __Unikraft__
#include <uk/config.h>
#include <uk/print.h>
#endif

int main(int argc, char *argv[])
{
#ifdef __Unikraft__
    uk_pr_info("Hello, world from TenonOS minimal test! argc=%d\n", argc);
    for (int i = 0; i < argc; ++i) {
        uk_pr_info("  argv[%d] = %s\n", i, argv[i]);
    }
#else
    std::printf("Hello, world from TenonOS minimal test! argc=%d\n", argc);
    for (int i = 0; i < argc; ++i) {
        std::printf("  argv[%d] = %s\n", i, argv[i]);
    }
    std::fflush(stdout);
#endif
    return 0;
}
