cmd_/home/curryking/tenonos_work/tenon-inference/build/libcontext/ctx.isr.o := /bin/bash /home/curryking/tenonos_work/tenon-inference/build/libcontext/ctx.isr.o.cmd

source_/home/curryking/tenonos_work/tenon-inference/build/libcontext/ctx.isr.o := /home/curryking/tenonos_work/tenon/arch/arm/ctx.c

deps_/home/curryking/tenonos_work/tenon-inference/build/libcontext/ctx.isr.o := \
    $(wildcard include/config/libukdebug.h) \
  /home/curryking/tenonos_work/tenon/include/uk/config.h \
  /home/curryking/tenonos_work/tenon/include/uk/arch/ctx.h \
    $(wildcard include/config/arch/x86/64.h) \
  /home/curryking/tenonos_work/tenon/include/uk/arch/types.h \
  /home/curryking/tenonos_work/tenon/arch/arm/arm64/include/uk/asm/intsizes.h \
  /home/curryking/tenonos_work/tenon/arch/arm/arm64/include/uk/asm/types.h \
  /home/curryking/tenonos_work/tenon/arch/arm/arm64/include/uk/asm/ctx.h \
  /home/curryking/tenonos_work/tenon/include/uk/essentials.h \
    $(wildcard include/config/libnewlibc.h) \
    $(wildcard include/config/have/sched.h) \
  /home/curryking/tenonos_work/tenon/include/uk/compiler.h \
  /home/curryking/tenonos_work/tenon/arch/arm/arm64/include/uk/asm/compiler.h \
    $(wildcard include/config/arm64/feat/pauth.h) \
    $(wildcard include/config/arm64/feat/bti.h) \
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
  /home/curryking/tenonos_work/tenon/arch/arm/arm64/include/uk/ctx.h \
  /home/curryking/tenonos_work/tenon/lib/ukthread/include/uk/thread.h \
    $(wildcard include/config/libuksched/runq/tailq.h) \
    $(wildcard include/config/libuksched/runq/list.h) \
    $(wildcard include/config/libuksched/thread/priority.h) \
    $(wildcard include/config/libuksched/lowest/priority.h) \
    $(wildcard include/config/libuksched/priority/level.h) \
  /home/curryking/tenonos_work/tenon/lib/nolibc/include/stdbool.h \
  /home/curryking/tenonos_work/tenon/lib/ukalloc/include/uk/alloc.h \
    $(wildcard include/config/libukalloc/ifstats.h) \
    $(wildcard include/config/libukalloc/ifmalloc.h) \
    $(wildcard include/config/libukalloc/ifstats/perlib.h) \
    $(wildcard include/config/libukalloc/ifstats/global.h) \
  /home/curryking/tenonos_work/tenon/lib/nolibc/include/errno.h \
  /home/curryking/tenonos_work/tenon/include/uk/arch/time.h \
  /home/curryking/tenonos_work/tenon/include/uk/plat/lcpu.h \
    $(wildcard include/config/have/smp.h) \
    $(wildcard include/config/ukplat/lcpu/maxcount.h) \
  /home/curryking/tenonos_work/tenon/include/uk/plat/offset.h \
  /home/curryking/tenonos_work/tenon/include/uk/plat/spinlock.h \
  /home/curryking/tenonos_work/tenon/include/uk/arch/spinlock.h \
  /home/curryking/tenonos_work/tenon/include/uk/list.h \
  /home/curryking/tenonos_work/tenon/lib/ukatomic/include/uk/atomic.h \
  /home/curryking/tenonos_work/tenon/lib/nolibc/include/stddef.h \
  /home/curryking/tenonos_work/tenon/lib/nolibc/include/nolibc-internal/shareddefs.h \
  /home/curryking/tenonos_work/tenon/include/uk/compat_list.h \
  /home/curryking/tenonos_work/tenon/include/uk/plat/tls.h \
  /home/curryking/tenonos_work/tenon/include/uk/arch/tls.h \
    $(wildcard include/config/ukarch/tls/have/tcb.h) \
  /home/curryking/tenonos_work/tenon/include/uk/prio.h \
  /home/curryking/tenonos_work/tenon/lib/tntimer/include/tn/timer.h \
  /home/curryking/tenonos_work/tenon/lib/tnsystick/include/tn/systick.h \
  /home/curryking/tenonos_work/tenon/lib/ukintctlr/include/uk/intctlr.h \
    $(wildcard include/config/libukintctlr/test.h) \
    $(wildcard include/config/libuktest/all.h) \
  /home/curryking/tenonos_work/tenon/include/uk/trace_macros.h \
    $(wildcard include/config/libtntrace.h) \

/home/curryking/tenonos_work/tenon-inference/build/libcontext/ctx.isr.o: $(deps_/home/curryking/tenonos_work/tenon-inference/build/libcontext/ctx.isr.o)

$(deps_/home/curryking/tenonos_work/tenon-inference/build/libcontext/ctx.isr.o):
