cmd_/root/tenonos_works/tenon-inference/build/libkvmplat/memory.common.o := /bin/bash /root/tenonos_works/tenon-inference/build/libkvmplat/memory.common.o.cmd

source_/root/tenonos_works/tenon-inference/build/libkvmplat/memory.common.o := /root/tenonos_works/tenon/plat/common/memory.c

deps_/root/tenonos_works/tenon-inference/build/libkvmplat/memory.common.o := \
    $(wildcard include/config/have/paging.h) \
  /root/tenonos_works/tenon-inference/build/libmusl/include/core/include/stdbool.h \
  /root/tenonos_works/tenon-inference/build/libmusl/include/dirent/include/stddef.h \
  /root/tenonos_works/tenon-inference/build/libmusl/origin/musl-1.2.3//arch/aarch64/bits/alltypes.h \
  /root/tenonos_works/tenon/plat/common/include/uk/plat/common/sections.h \
  /root/tenonos_works/tenon/plat/common/include/uk/plat/common/bootinfo.h \
    $(wildcard include/config/ukplat/memrname.h) \
    $(wildcard include/config/cmdline/max/len.h) \
  /root/tenonos_works/tenon/include/uk/arch/types.h \
  /root/tenonos_works/tenon/arch/arm/arm64/include/uk/asm/intsizes.h \
  /root/tenonos_works/tenon/arch/arm/arm64/include/uk/asm/types.h \
  /root/tenonos_works/tenon/include/uk/arch/limits.h \
  /root/tenonos_works/tenon/include/uk/config.h \
  /root/tenonos_works/tenon/arch/arm/arm64/include/uk/asm/limits.h \
    $(wildcard include/config/stack/size/page/order.h) \
    $(wildcard include/config/cpu/except/stack/size/page/order.h) \
  /root/tenonos_works/tenon/include/uk/plat/memory.h \
    $(wildcard include/config/libukvmem.h) \
    $(wildcard include/config/arch/arm/64.h) \
    $(wildcard include/config/auxsp/page/order.h) \
    $(wildcard include/config/ukplat/auxsp/page/order.h) \
  /root/tenonos_works/tenon/lib/ukalloc/include/uk/alloc.h \
    $(wildcard include/config/libukalloc/ifstats.h) \
    $(wildcard include/config/libukalloc/ifmalloc.h) \
    $(wildcard include/config/libukalloc/ifstats/perlib.h) \
    $(wildcard include/config/libukalloc/ifstats/global.h) \
  /root/tenonos_works/tenon/lib/ukdebug/include/uk/assert.h \
    $(wildcard include/config/libukdebug/enable/assert.h) \
  /root/tenonos_works/tenon/include/uk/plat/bootstrap.h \
  /root/tenonos_works/tenon/include/uk/essentials.h \
    $(wildcard include/config/libnewlibc.h) \
    $(wildcard include/config/have/sched.h) \
  /root/tenonos_works/tenon/include/uk/compiler.h \
  /root/tenonos_works/tenon/arch/arm/arm64/include/uk/asm/compiler.h \
    $(wildcard include/config/arm64/feat/pauth.h) \
    $(wildcard include/config/arm64/feat/bti.h) \
  /root/tenonos_works/tenon/include/uk/arch/lcpu.h \
  /root/tenonos_works/tenon/arch/arm/arm64/include/uk/asm/lcpu.h \
    $(wildcard include/config/arm64/feat/mte.h) \
    $(wildcard include/config/paging.h) \
  /root/tenonos_works/tenon/include/uk/asm.h \
  /root/tenonos_works/tenon/arch/arm/arm64/include/uk/asm/arch.h \
  /root/tenonos_works/tenon-inference/build/libmusl/include/dirent/include/stdint.h \
  /root/tenonos_works/tenon-inference/build/libmusl/origin/musl-1.2.3//arch/aarch64/bits/stdint.h \
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
  /root/tenonos_works/tenon-inference/build/libmusl/include/mq/include/errno.h \
  /root/tenonos_works/tenon-inference/build/libmusl/include/core/include/features.h \
  /root/tenonos_works/tenon-inference/build/libmusl/origin/musl-1.2.3//arch/generic/bits/errno.h \
  /root/tenonos_works/tenon/include/uk/arch/ctx.h \
    $(wildcard include/config/libukdebug.h) \
    $(wildcard include/config/arch/x86/64.h) \
  /root/tenonos_works/tenon/arch/arm/arm64/include/uk/asm/ctx.h \
  /root/tenonos_works/tenon/include/uk/arch/paging.h \
  /root/tenonos_works/tenon/arch/arm/arm64/include/uk/asm/paging.h \
  /root/tenonos_works/tenon/plat/common/include/uk/plat/common/memory.h \
    $(wildcard include/config/have/smp.h) \
  /root/tenonos_works/tenon-inference/build/libmusl/include/dirent/include/string.h \
  /root/tenonos_works/tenon-inference/build/libmusl/include/misc/include/strings.h \

/root/tenonos_works/tenon-inference/build/libkvmplat/memory.common.o: $(deps_/root/tenonos_works/tenon-inference/build/libkvmplat/memory.common.o)

$(deps_/root/tenonos_works/tenon-inference/build/libkvmplat/memory.common.o):
