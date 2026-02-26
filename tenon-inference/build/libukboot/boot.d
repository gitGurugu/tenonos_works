cmd_/home/curryking/tenonos_work/tenon-inference/build/libukboot/boot.o := /bin/bash /home/curryking/tenonos_work/tenon-inference/build/libukboot/boot.o.cmd

source_/home/curryking/tenonos_work/tenon-inference/build/libukboot/boot.o := /home/curryking/tenonos_work/tenon/lib/ukboot/boot.c

deps_/home/curryking/tenonos_work/tenon-inference/build/libukboot/boot.o := \
    $(wildcard include/config/have/paging.h) \
    $(wildcard include/config/libukvmem.h) \
    $(wildcard include/config/libukboot/initbbuddy.h) \
    $(wildcard include/config/libukboot/initregion.h) \
    $(wildcard include/config/libukboot/initmimalloc.h) \
    $(wildcard include/config/libukboot/inittlsf.h) \
    $(wildcard include/config/libukboot/inittinyalloc.h) \
    $(wildcard include/config/libuksched.h) \
    $(wildcard include/config/custom/cpu/entrypoint.h) \
    $(wildcard include/config/libukboot/initschedcoop.h) \
    $(wildcard include/config/libukboot/initschedprio.h) \
    $(wildcard include/config/libuklibparam.h) \
    $(wildcard include/config/libuksp.h) \
    $(wildcard include/config/libukintctlr.h) \
    $(wildcard include/config/ukplat/lcpu/maxcount.h) \
    $(wildcard include/config/libposix/environ.h) \
    $(wildcard include/config/libukboot/heap/base.h) \
    $(wildcard include/config/ukplat/memrname.h) \
    $(wildcard include/config/libukboot/maxnbargs.h) \
    $(wildcard include/config/have/sched.h) \
    $(wildcard include/config/libuksched/thread/priority.h) \
    $(wildcard include/config/libukdebug/printk/info.h) \
    $(wildcard include/config/libukalloc.h) \
    $(wildcard include/config/libukboot/noalloc.h) \
    $(wildcard include/config/have/smp.h) \
    $(wildcard include/config/libuklock/semaphore.h) \
    $(wildcard include/config/have/systick.h) \
    $(wildcard include/config/libukboot/nosched.h) \
  /home/curryking/tenonos_work/tenon/include/uk/config.h \
  /home/curryking/tenonos_work/tenon/lib/nolibc/include/stddef.h \
  /home/curryking/tenonos_work/tenon/include/uk/arch/types.h \
  /home/curryking/tenonos_work/tenon/arch/arm/arm64/include/uk/asm/intsizes.h \
  /home/curryking/tenonos_work/tenon/arch/arm/arm64/include/uk/asm/types.h \
  /home/curryking/tenonos_work/tenon/lib/nolibc/include/nolibc-internal/shareddefs.h \
  /home/curryking/tenonos_work/tenon/lib/nolibc/include/stdio.h \
    $(wildcard include/config/libvfscore.h) \
  /home/curryking/tenonos_work/tenon/include/uk/essentials.h \
    $(wildcard include/config/libnewlibc.h) \
  /home/curryking/tenonos_work/tenon/include/uk/compiler.h \
  /home/curryking/tenonos_work/tenon/arch/arm/arm64/include/uk/asm/compiler.h \
    $(wildcard include/config/arm64/feat/pauth.h) \
    $(wildcard include/config/arm64/feat/bti.h) \
  /home/curryking/tenonos_work/tenon/lib/nolibc/include/errno.h \
  /home/curryking/tenonos_work/tenon/lib/ukboot/include/uk/boot.h \
  /home/curryking/tenonos_work/tenon/include/uk/plat/bootstrap.h \
  /home/curryking/tenonos_work/tenon/lib/ukallocbbuddy/include/uk/allocbbuddy.h \
  /home/curryking/tenonos_work/tenon/lib/ukalloc/include/uk/alloc.h \
    $(wildcard include/config/libukalloc/ifstats.h) \
    $(wildcard include/config/libukalloc/ifmalloc.h) \
    $(wildcard include/config/libukalloc/ifstats/perlib.h) \
    $(wildcard include/config/libukalloc/ifstats/global.h) \
  /home/curryking/tenonos_work/tenon/lib/ukdebug/include/uk/assert.h \
    $(wildcard include/config/libukdebug/enable/assert.h) \
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
    $(wildcard include/config/libukdebug/printk.h) \
  /home/curryking/tenonos_work/tenon/lib/nolibc/include/stdarg.h \
  /home/curryking/tenonos_work/tenon/lib/uklibid/include/uk/libid.h \
    $(wildcard include/config/have/libc.h) \
    $(wildcard include/config/libnolibc.h) \
  /home/curryking/tenonos_work/tenon-inference/build/libuklibid/include/uk/bits/libid.h \
  /home/curryking/tenonos_work/tenon/lib/uksched/include/uk/sched.h \
  /home/curryking/tenonos_work/tenon/include/uk/plat/tls.h \
    $(wildcard include/config/libukdebug.h) \
  /home/curryking/tenonos_work/tenon/include/uk/arch/tls.h \
    $(wildcard include/config/ukarch/tls/have/tcb.h) \
  /home/curryking/tenonos_work/tenon/lib/ukthread/include/uk/thread.h \
    $(wildcard include/config/libuksched/runq/tailq.h) \
    $(wildcard include/config/libuksched/runq/list.h) \
    $(wildcard include/config/libuksched/lowest/priority.h) \
    $(wildcard include/config/libuksched/priority/level.h) \
  /home/curryking/tenonos_work/tenon/lib/nolibc/include/stdbool.h \
  /home/curryking/tenonos_work/tenon/include/uk/arch/time.h \
  /home/curryking/tenonos_work/tenon/include/uk/arch/ctx.h \
    $(wildcard include/config/arch/x86/64.h) \
  /home/curryking/tenonos_work/tenon/arch/arm/arm64/include/uk/asm/ctx.h \
  /home/curryking/tenonos_work/tenon/include/uk/plat/lcpu.h \
  /home/curryking/tenonos_work/tenon/include/uk/plat/offset.h \
  /home/curryking/tenonos_work/tenon/include/uk/plat/spinlock.h \
  /home/curryking/tenonos_work/tenon/include/uk/arch/spinlock.h \
  /home/curryking/tenonos_work/tenon/include/uk/list.h \
  /home/curryking/tenonos_work/tenon/lib/ukatomic/include/uk/atomic.h \
  /home/curryking/tenonos_work/tenon/include/uk/compat_list.h \
  /home/curryking/tenonos_work/tenon/include/uk/prio.h \
  /home/curryking/tenonos_work/tenon/lib/tntimer/include/tn/timer.h \
  /home/curryking/tenonos_work/tenon/lib/tnsystick/include/tn/systick.h \
  /home/curryking/tenonos_work/tenon/lib/ukintctlr/include/uk/intctlr.h \
    $(wildcard include/config/libukintctlr/test.h) \
    $(wildcard include/config/libuktest/all.h) \
  /home/curryking/tenonos_work/tenon/include/uk/trace_macros.h \
    $(wildcard include/config/libtntrace.h) \
  /home/curryking/tenonos_work/tenon/lib/ukschedcoop/include/uk/schedcoop.h \
  /home/curryking/tenonos_work/tenon/include/uk/plat/memory.h \
    $(wildcard include/config/arch/arm/64.h) \
    $(wildcard include/config/auxsp/page/order.h) \
    $(wildcard include/config/ukplat/auxsp/page/order.h) \
  /home/curryking/tenonos_work/tenon/include/uk/arch/paging.h \
  /home/curryking/tenonos_work/tenon/arch/arm/arm64/include/uk/asm/paging.h \
  /home/curryking/tenonos_work/tenon/include/uk/plat/time.h \
    $(wildcard include/config/hz.h) \
  /home/curryking/tenonos_work/tenon/include/uk/ctors.h \
  /home/curryking/tenonos_work/tenon/include/uk/init.h \
  /home/curryking/tenonos_work/tenon/lib/ukargparse/include/uk/argparse.h \
  /home/curryking/tenonos_work/tenon/include/uk/errptr.h \
  /home/curryking/tenonos_work/tenon/lib/ukboot/banner.h \
    $(wildcard include/config/libukboot/banner/none.h) \
  /home/curryking/tenonos_work/tenon/lib/ukboot/shutdown_req.h \
  /home/curryking/tenonos_work/tenon/lib/uklock/include/uk/semaphore.h \
  /home/curryking/tenonos_work/tenon/lib/uklock/include/uk/spinlock.h \
    $(wildcard include/config/libuklock/ticketlock.h) \
  /home/curryking/tenonos_work/tenon/lib/uksched/include/uk/wait.h \
  /home/curryking/tenonos_work/tenon/lib/uksched/include/uk/wait_types.h \
    $(wildcard include/config/libuksched/waitq/stailq.h) \
    $(wildcard include/config/libuksched/waitq/list.h) \
  /home/curryking/tenonos_work/tenon/lib/uksched/include/uk/wait_queue.h \

/home/curryking/tenonos_work/tenon-inference/build/libukboot/boot.o: $(deps_/home/curryking/tenonos_work/tenon-inference/build/libukboot/boot.o)

$(deps_/home/curryking/tenonos_work/tenon-inference/build/libukboot/boot.o):
