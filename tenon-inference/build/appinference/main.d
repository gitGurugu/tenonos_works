cmd_/home/curryking/tenonos_work/tenon-inference/build/appinference/main.o := /bin/bash /home/curryking/tenonos_work/tenon-inference/build/appinference/main.o.cmd

source_/home/curryking/tenonos_work/tenon-inference/build/appinference/main.o := /home/curryking/tenonos_work/tenon-inference/main.c

deps_/home/curryking/tenonos_work/tenon-inference/build/appinference/main.o := \
    $(wildcard include/config/appinference/metrics.h) \
    $(wildcard include/config/appinference/log/level.h) \
    $(wildcard include/config/appinference/thread/count.h) \
    $(wildcard include/config/appinference/batch/enabled.h) \
    $(wildcard include/config/appinference/enable/preemptive.h) \
    $(wildcard include/config/appinference/queue/size.h) \
    $(wildcard include/config/appinference/batch/max/size.h) \
    $(wildcard include/config/appinference/batch/timeout/us.h) \
    $(wildcard include/config/appinference/max/model/size.h) \
    $(wildcard include/config/appinference/enable/multi/model.h) \
    $(wildcard include/config/appinference/model/mem/limit.h) \
  /home/curryking/tenonos_work/tenon/lib/nolibc/include/stdio.h \
    $(wildcard include/config/libvfscore.h) \
  /home/curryking/tenonos_work/tenon/include/uk/essentials.h \
    $(wildcard include/config/libnewlibc.h) \
    $(wildcard include/config/have/sched.h) \
  /home/curryking/tenonos_work/tenon/include/uk/config.h \
  /home/curryking/tenonos_work/tenon/include/uk/compiler.h \
  /home/curryking/tenonos_work/tenon/arch/arm/arm64/include/uk/asm/compiler.h \
    $(wildcard include/config/arm64/feat/pauth.h) \
    $(wildcard include/config/arm64/feat/bti.h) \
  /home/curryking/tenonos_work/tenon/include/uk/arch/types.h \
  /home/curryking/tenonos_work/tenon/arch/arm/arm64/include/uk/asm/intsizes.h \
  /home/curryking/tenonos_work/tenon/arch/arm/arm64/include/uk/asm/types.h \
  /home/curryking/tenonos_work/tenon/lib/nolibc/include/nolibc-internal/shareddefs.h \
  /home/curryking/tenonos_work/tenon/lib/nolibc/include/string.h \
  /home/curryking/tenonos_work/tenon/lib/nolibc/include/stdlib.h \
    $(wildcard include/config/libukalloc.h) \
    $(wildcard include/config/libposix/environ.h) \
    $(wildcard include/config/libposix/process.h) \
  /home/curryking/tenonos_work/tenon/lib/ukalloc/include/uk/alloc.h \
    $(wildcard include/config/libukalloc/ifstats.h) \
    $(wildcard include/config/libukalloc/ifmalloc.h) \
    $(wildcard include/config/libukalloc/ifstats/perlib.h) \
    $(wildcard include/config/libukalloc/ifstats/global.h) \
  /home/curryking/tenonos_work/tenon/lib/ukdebug/include/uk/assert.h \
    $(wildcard include/config/libukdebug/enable/assert.h) \
  /home/curryking/tenonos_work/tenon/include/uk/plat/bootstrap.h \
  /home/curryking/tenonos_work/tenon/include/uk/arch/lcpu.h \
  /home/curryking/tenonos_work/tenon/arch/arm/arm64/include/uk/asm/lcpu.h \
    $(wildcard include/config/arm64/feat/mte.h) \
    $(wildcard include/config/paging.h) \
  /home/curryking/tenonos_work/tenon/include/uk/asm.h \
  /home/curryking/tenonos_work/tenon/arch/arm/arm64/include/uk/asm/arch.h \
  /home/curryking/tenonos_work/tenon/lib/nolibc/include/stdint.h \
  /home/curryking/tenonos_work/tenon/include/uk/arch/limits.h \
  /home/curryking/tenonos_work/tenon/arch/arm/arm64/include/uk/asm/limits.h \
    $(wildcard include/config/stack/size/page/order.h) \
    $(wildcard include/config/cpu/except/stack/size/page/order.h) \
  /home/curryking/tenonos_work/tenon/lib/ukdebug/include/uk/print.h \
    $(wildcard include/config/libukdebug/printd.h) \
    $(wildcard include/config/libukdebug/printk/crit.h) \
    $(wildcard include/config/libukdebug/printk/err.h) \
    $(wildcard include/config/libukdebug/printk/warn.h) \
    $(wildcard include/config/libukdebug/printk/info.h) \
    $(wildcard include/config/libukdebug/printk.h) \
  /home/curryking/tenonos_work/tenon/lib/nolibc/include/stdarg.h \
  /home/curryking/tenonos_work/tenon/lib/uklibid/include/uk/libid.h \
    $(wildcard include/config/have/libc.h) \
    $(wildcard include/config/libnolibc.h) \
  /home/curryking/tenonos_work/tenon-inference/build/libuklibid/include/uk/bits/libid.h \
  /home/curryking/tenonos_work/tenon/lib/nolibc/include/errno.h \
  /home/curryking/tenonos_work/tenon-inference/src/api.h \
  /home/curryking/tenonos_work/tenon/lib/nolibc/include/stddef.h \
  /home/curryking/tenonos_work/tenon/lib/nolibc/include/stdbool.h \
  /home/curryking/tenonos_work/tenon-inference/src/threadpool.h \
  /home/curryking/tenonos_work/tenon-inference/src/mempool.h \
  /home/curryking/tenonos_work/tenon-inference/src/scheduler.h \
  /home/curryking/tenonos_work/tenon-inference/src/batch.h \
  /home/curryking/tenonos_work/tenon-inference/src/loader.h \
  /home/curryking/tenonos_work/tenon-inference/src/metrics.h \
  /home/curryking/tenonos_work/tenon-inference/src/api.h \
  /home/curryking/tenonos_work/tenon-inference/src/logger.h \

/home/curryking/tenonos_work/tenon-inference/build/appinference/main.o: $(deps_/home/curryking/tenonos_work/tenon-inference/build/appinference/main.o)

$(deps_/home/curryking/tenonos_work/tenon-inference/build/appinference/main.o):
