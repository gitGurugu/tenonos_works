cmd_/root/tenonos_works/tenon-inference/build/libukthread/thread.o := /bin/bash /root/tenonos_works/tenon-inference/build/libukthread/thread.o.cmd

source_/root/tenonos_works/tenon-inference/build/libukthread/thread.o := /root/tenonos_works/tenon/lib/ukthread/thread.c

deps_/root/tenonos_works/tenon-inference/build/libukthread/thread.o := \
    $(wildcard include/config/libuksched/tcb/init.h) \
    $(wildcard include/config/ukarch/tls/have/tcb.h) \
    $(wildcard include/config/libuksched/thread/priority.h) \
    $(wildcard include/config/libukvmem.h) \
    $(wildcard include/config/ukplat/auxsp/page/order.h) \
    $(wildcard include/config/have/sched.h) \
  /root/tenonos_works/tenon-inference/build/libmusl/include/dirent/include/string.h \
  /root/tenonos_works/tenon-inference/build/libmusl/include/core/include/features.h \
  /root/tenonos_works/tenon-inference/build/libmusl/origin/musl-1.2.3//arch/aarch64/bits/alltypes.h \
  /root/tenonos_works/tenon-inference/build/libmusl/include/misc/include/strings.h \
  /root/tenonos_works/tenon-inference/build/libmusl/include/dirent/include/stdlib.h \
  /root/tenonos_works/tenon-inference/build/libmusl/include/core/include/alloca.h \
  /root/tenonos_works/tenon-inference/build/libmusl/include/mq/include/errno.h \
  /root/tenonos_works/tenon-inference/build/libmusl/origin/musl-1.2.3//arch/generic/bits/errno.h \
  /root/tenonos_works/tenon/include/uk/plat/config.h \
  /root/tenonos_works/tenon/include/uk/arch/limits.h \
  /root/tenonos_works/tenon/include/uk/config.h \
  /root/tenonos_works/tenon/arch/arm/arm64/include/uk/asm/limits.h \
    $(wildcard include/config/stack/size/page/order.h) \
    $(wildcard include/config/cpu/except/stack/size/page/order.h) \
  /root/tenonos_works/tenon/arch/arm/arm64/include/uk/asm/intsizes.h \
  /root/tenonos_works/tenon/include/uk/plat/tls.h \
    $(wildcard include/config/libukdebug.h) \
  /root/tenonos_works/tenon/include/uk/arch/types.h \
  /root/tenonos_works/tenon/arch/arm/arm64/include/uk/asm/types.h \
  /root/tenonos_works/tenon/include/uk/arch/tls.h \
  /root/tenonos_works/tenon/include/uk/arch/lcpu.h \
  /root/tenonos_works/tenon/arch/arm/arm64/include/uk/asm/lcpu.h \
    $(wildcard include/config/arm64/feat/mte.h) \
    $(wildcard include/config/arm64/feat/bti.h) \
    $(wildcard include/config/paging.h) \
  /root/tenonos_works/tenon/include/uk/asm.h \
  /root/tenonos_works/tenon/arch/arm/arm64/include/uk/asm/arch.h \
  /root/tenonos_works/tenon/include/uk/essentials.h \
    $(wildcard include/config/libnewlibc.h) \
  /root/tenonos_works/tenon/include/uk/compiler.h \
  /root/tenonos_works/tenon/arch/arm/arm64/include/uk/asm/compiler.h \
    $(wildcard include/config/arm64/feat/pauth.h) \
  /root/tenonos_works/tenon-inference/build/libmusl/include/dirent/include/stdint.h \
  /root/tenonos_works/tenon-inference/build/libmusl/origin/musl-1.2.3//arch/aarch64/bits/stdint.h \
  /root/tenonos_works/tenon/lib/ukdebug/include/uk/assert.h \
    $(wildcard include/config/libukdebug/enable/assert.h) \
  /root/tenonos_works/tenon/include/uk/plat/bootstrap.h \
  /root/tenonos_works/tenon/lib/ukdebug/include/uk/print.h \
    $(wildcard include/config/libukdebug/printd.h) \
    $(wildcard include/config/libukdebug/printk/crit.h) \
    $(wildcard include/config/libukdebug/printk/err.h) \
    $(wildcard include/config/libukdebug/printk/warn.h) \
    $(wildcard include/config/libukdebug/printk/info.h) \
    $(wildcard include/config/libukdebug/printk.h) \
  /root/tenonos_works/tenon-inference/build/libmusl/include/mq/include/stdarg.h \
  /root/tenonos_works/tenon/lib/uklibid/include/uk/libid.h \
    $(wildcard include/config/have/libc.h) \
    $(wildcard include/config/libnolibc.h) \
  /root/tenonos_works/tenon-inference/build/libuklibid/include/uk/bits/libid.h \
  /root/tenonos_works/tenon/lib/ukthread/include/uk/thread.h \
    $(wildcard include/config/libuksched/runq/tailq.h) \
    $(wildcard include/config/libuksched/runq/list.h) \
    $(wildcard include/config/libuksched/lowest/priority.h) \
    $(wildcard include/config/libuksched/priority/level.h) \
  /root/tenonos_works/tenon-inference/build/libmusl/include/core/include/stdbool.h \
  /root/tenonos_works/tenon/lib/ukalloc/include/uk/alloc.h \
    $(wildcard include/config/libukalloc/ifstats.h) \
    $(wildcard include/config/libukalloc/ifmalloc.h) \
    $(wildcard include/config/libukalloc/ifstats/perlib.h) \
    $(wildcard include/config/libukalloc/ifstats/global.h) \
  /root/tenonos_works/tenon/include/uk/arch/time.h \
  /root/tenonos_works/tenon/include/uk/arch/ctx.h \
    $(wildcard include/config/arch/x86/64.h) \
  /root/tenonos_works/tenon/arch/arm/arm64/include/uk/asm/ctx.h \
  /root/tenonos_works/tenon/include/uk/plat/lcpu.h \
    $(wildcard include/config/have/smp.h) \
    $(wildcard include/config/ukplat/lcpu/maxcount.h) \
  /root/tenonos_works/tenon/include/uk/plat/offset.h \
  /root/tenonos_works/tenon/include/uk/plat/spinlock.h \
  /root/tenonos_works/tenon/include/uk/arch/spinlock.h \
  /root/tenonos_works/tenon/include/uk/list.h \
  /root/tenonos_works/tenon/lib/ukatomic/include/uk/atomic.h \
  /root/tenonos_works/tenon-inference/build/libmusl/include/dirent/include/stddef.h \
  /root/tenonos_works/tenon/include/uk/compat_list.h \
  /root/tenonos_works/tenon/include/uk/prio.h \
  /root/tenonos_works/tenon/lib/tntimer/include/tn/timer.h \
  /root/tenonos_works/tenon/lib/tnsystick/include/tn/systick.h \
  /root/tenonos_works/tenon/lib/ukintctlr/include/uk/intctlr.h \
    $(wildcard include/config/libukintctlr/test.h) \
    $(wildcard include/config/libuktest/all.h) \
  /root/tenonos_works/tenon/include/uk/trace_macros.h \
    $(wildcard include/config/libtntrace.h) \
  /root/tenonos_works/tenon/lib/ukthread/include/uk/tcb_impl.h \
  /root/tenonos_works/tenon/include/uk/plat/memory.h \
    $(wildcard include/config/arch/arm/64.h) \
    $(wildcard include/config/ukplat/memrname.h) \
    $(wildcard include/config/auxsp/page/order.h) \
  /root/tenonos_works/tenon/include/uk/arch/paging.h \
  /root/tenonos_works/tenon/arch/arm/arm64/include/uk/asm/paging.h \

/root/tenonos_works/tenon-inference/build/libukthread/thread.o: $(deps_/root/tenonos_works/tenon-inference/build/libukthread/thread.o)

$(deps_/root/tenonos_works/tenon-inference/build/libukthread/thread.o):
