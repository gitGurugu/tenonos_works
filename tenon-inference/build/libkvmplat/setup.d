cmd_/home/curryking/tenonos_work/tenon-inference/build/libkvmplat/setup.o := /bin/bash /home/curryking/tenonos_work/tenon-inference/build/libkvmplat/setup.o.cmd

source_/home/curryking/tenonos_work/tenon-inference/build/libkvmplat/setup.o := /home/curryking/tenonos_work/tenon/plat/kvm/arm/setup.c

deps_/home/curryking/tenonos_work/tenon-inference/build/libkvmplat/setup.o := \
    $(wildcard include/config/rtc/pl031.h) \
    $(wildcard include/config/enforce/w/xor/x.h) \
    $(wildcard include/config/paging.h) \
    $(wildcard include/config/arm64/feat/pauth.h) \
    $(wildcard include/config/have/memtag.h) \
    $(wildcard include/config/ukplat/acpi.h) \
    $(wildcard include/config/have/smp.h) \
    $(wildcard include/config/ukplat/lcpu/run/irq.h) \
    $(wildcard include/config/ukplat/lcpu/wakeup/irq.h) \
  /home/curryking/tenonos_work/tenon/include/uk/config.h \
  /home/curryking/tenonos_work/tenon/lib/fdt/include/libfdt.h \
  /home/curryking/tenonos_work/tenon/lib/fdt/include/libfdt_env.h \
  /home/curryking/tenonos_work/tenon/lib/nolibc/include/stdbool.h \
  /home/curryking/tenonos_work/tenon/lib/nolibc/include/stddef.h \
  /home/curryking/tenonos_work/tenon/include/uk/arch/types.h \
  /home/curryking/tenonos_work/tenon/arch/arm/arm64/include/uk/asm/intsizes.h \
  /home/curryking/tenonos_work/tenon/arch/arm/arm64/include/uk/asm/types.h \
  /home/curryking/tenonos_work/tenon/lib/nolibc/include/nolibc-internal/shareddefs.h \
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
  /home/curryking/tenonos_work/tenon/plat/common/include/uk/plat/common/sections.h \
  /home/curryking/tenonos_work/tenon/plat/common/include/uk/plat/common/bootinfo.h \
    $(wildcard include/config/ukplat/memrname.h) \
    $(wildcard include/config/cmdline/max/len.h) \
  /home/curryking/tenonos_work/tenon/include/uk/plat/memory.h \
    $(wildcard include/config/libukvmem.h) \
    $(wildcard include/config/arch/arm/64.h) \
    $(wildcard include/config/auxsp/page/order.h) \
    $(wildcard include/config/ukplat/auxsp/page/order.h) \
  /home/curryking/tenonos_work/tenon/include/uk/arch/ctx.h \
    $(wildcard include/config/libukdebug.h) \
    $(wildcard include/config/arch/x86/64.h) \
  /home/curryking/tenonos_work/tenon/arch/arm/arm64/include/uk/asm/ctx.h \
  /home/curryking/tenonos_work/tenon/include/uk/arch/paging.h \
  /home/curryking/tenonos_work/tenon/arch/arm/arm64/include/uk/asm/paging.h \
  /home/curryking/tenonos_work/tenon/plat/common/include/uk/plat/common/memory.h \
  /home/curryking/tenonos_work/tenon/plat/common/include/uk/plat/common/acpi.h \
  /home/curryking/tenonos_work/tenon/plat/common/include/uk/plat/common/sdt.h \
  /home/curryking/tenonos_work/tenon/plat/common/include/uk/plat/common/madt.h \
  /home/curryking/tenonos_work/tenon/include/uk/plat/lcpu.h \
    $(wildcard include/config/ukplat/lcpu/maxcount.h) \
  /home/curryking/tenonos_work/tenon/include/uk/arch/time.h \
  /home/curryking/tenonos_work/tenon/include/uk/plat/offset.h \
  /home/curryking/tenonos_work/tenon/include/uk/plat/spinlock.h \
  /home/curryking/tenonos_work/tenon/include/uk/arch/spinlock.h \
  /home/curryking/tenonos_work/tenon/include/uk/list.h \
  /home/curryking/tenonos_work/tenon/lib/ukatomic/include/uk/atomic.h \
  /home/curryking/tenonos_work/tenon/include/uk/compat_list.h \
  /home/curryking/tenonos_work/tenon/plat/kvm/include/kvm-arm64/uart.h \
    $(wildcard include/config/libuktty/ns16550.h) \
    $(wildcard include/config/libuktty/pl011.h) \
  /home/curryking/tenonos_work/tenon/drivers/uktty/pl011/include/uk/tty/pl011.h \
  /home/curryking/tenonos_work/tenon/plat/drivers/include/rtc/pl031.h \
  /home/curryking/tenonos_work/tenon/plat/drivers/include/rtc/rtc.h \
  /home/curryking/tenonos_work/tenon/lib/ukintctlr/include/uk/intctlr.h \
    $(wildcard include/config/libukintctlr/test.h) \
    $(wildcard include/config/libuktest/all.h) \
  /home/curryking/tenonos_work/tenon/plat/common/include/arm/cpu.h \
  /home/curryking/tenonos_work/tenon/plat/common/include/arm/arm64/cpu.h \
    $(wildcard include/config/fpsimd.h) \
  /home/curryking/tenonos_work/tenon/lib/nolibc/include/inttypes.h \
  /home/curryking/tenonos_work/tenon/plat/common/include/arm/smccc.h \

/home/curryking/tenonos_work/tenon-inference/build/libkvmplat/setup.o: $(deps_/home/curryking/tenonos_work/tenon-inference/build/libkvmplat/setup.o)

$(deps_/home/curryking/tenonos_work/tenon-inference/build/libkvmplat/setup.o):
