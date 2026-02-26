cmd_/home/curryking/tenonos_work/tenon-inference/build/libuktty_pl011/pl011.o := /bin/bash /home/curryking/tenonos_work/tenon-inference/build/libuktty_pl011/pl011.o.cmd

source_/home/curryking/tenonos_work/tenon-inference/build/libuktty_pl011/pl011.o := /home/curryking/tenonos_work/tenon/drivers/uktty/pl011/pl011.c

deps_/home/curryking/tenonos_work/tenon-inference/build/libuktty_pl011/pl011.o := \
    $(wildcard include/config/libuktty/pl011/early/console/base.h) \
    $(wildcard include/config/libuktty/pl011/early/console.h) \
  /home/curryking/tenonos_work/tenon/lib/fdt/include/libfdt.h \
  /home/curryking/tenonos_work/tenon/lib/fdt/include/libfdt_env.h \
  /home/curryking/tenonos_work/tenon/lib/nolibc/include/stdbool.h \
  /home/curryking/tenonos_work/tenon/lib/nolibc/include/stddef.h \
  /home/curryking/tenonos_work/tenon/include/uk/arch/types.h \
  /home/curryking/tenonos_work/tenon/arch/arm/arm64/include/uk/asm/intsizes.h \
  /home/curryking/tenonos_work/tenon/arch/arm/arm64/include/uk/asm/types.h \
  /home/curryking/tenonos_work/tenon/lib/nolibc/include/nolibc-internal/shareddefs.h \
  /home/curryking/tenonos_work/tenon/include/uk/config.h \
  /home/curryking/tenonos_work/tenon/lib/nolibc/include/stdint.h \
  /home/curryking/tenonos_work/tenon/include/uk/arch/limits.h \
  /home/curryking/tenonos_work/tenon/arch/arm/arm64/include/uk/asm/limits.h \
    $(wildcard include/config/stack/size/page/order.h) \
    $(wildcard include/config/cpu/except/stack/size/page/order.h) \
  /home/curryking/tenonos_work/tenon/lib/nolibc/include/stdlib.h \
    $(wildcard include/config/libukalloc.h) \
    $(wildcard include/config/libposix/environ.h) \
    $(wildcard include/config/libposix/process.h) \
  /home/curryking/tenonos_work/tenon/include/uk/essentials.h \
    $(wildcard include/config/libnewlibc.h) \
    $(wildcard include/config/have/sched.h) \
  /home/curryking/tenonos_work/tenon/include/uk/compiler.h \
  /home/curryking/tenonos_work/tenon/arch/arm/arm64/include/uk/asm/compiler.h \
    $(wildcard include/config/arm64/feat/pauth.h) \
    $(wildcard include/config/arm64/feat/bti.h) \
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
  /home/curryking/tenonos_work/tenon/lib/nolibc/include/string.h \
  /home/curryking/tenonos_work/tenon/lib/nolibc/include/limits.h \
  /home/curryking/tenonos_work/tenon/lib/fdt/include/fdt.h \
  /home/curryking/tenonos_work/tenon/lib/ukbitops/include/uk/bitops.h \
  /home/curryking/tenonos_work/tenon/lib/ukbitops/arch/arm64/include/uk/asm/bitops.h \
  /home/curryking/tenonos_work/tenon/lib/nolibc/include/sys/param.h \
  /home/curryking/tenonos_work/tenon/lib/ukbitops/include/uk/bitcount.h \
  /home/curryking/tenonos_work/tenon/lib/ukatomic/include/uk/atomic.h \
  /home/curryking/tenonos_work/tenon/lib/ukofw/include/uk/ofw/fdt.h \
  /home/curryking/tenonos_work/tenon/include/uk/plat/console.h \
  /home/curryking/tenonos_work/tenon/lib/uklock/include/uk/spinlock.h \
    $(wildcard include/config/libuklock/ticketlock.h) \
    $(wildcard include/config/arch/arm/64.h) \
  /home/curryking/tenonos_work/tenon/include/uk/plat/lcpu.h \
    $(wildcard include/config/have/smp.h) \
    $(wildcard include/config/ukplat/lcpu/maxcount.h) \
  /home/curryking/tenonos_work/tenon/include/uk/arch/time.h \
  /home/curryking/tenonos_work/tenon/include/uk/plat/offset.h \
  /home/curryking/tenonos_work/tenon/include/uk/plat/spinlock.h \
  /home/curryking/tenonos_work/tenon/include/uk/arch/spinlock.h \
  /home/curryking/tenonos_work/tenon/include/uk/list.h \
  /home/curryking/tenonos_work/tenon/include/uk/compat_list.h \
  /home/curryking/tenonos_work/tenon/drivers/uktty/pl011/include/uk/tty/pl011.h \

/home/curryking/tenonos_work/tenon-inference/build/libuktty_pl011/pl011.o: $(deps_/home/curryking/tenonos_work/tenon-inference/build/libuktty_pl011/pl011.o)

$(deps_/home/curryking/tenonos_work/tenon-inference/build/libuktty_pl011/pl011.o):
