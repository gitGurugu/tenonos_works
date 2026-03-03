cmd_/root/tenonos_works/tenon-inference/build/libukintctlr_gic/ukintctlr.o := /bin/bash /root/tenonos_works/tenon-inference/build/libukintctlr_gic/ukintctlr.o.cmd

source_/root/tenonos_works/tenon-inference/build/libukintctlr_gic/ukintctlr.o := /root/tenonos_works/tenon/drivers/ukintctlr/gic/ukintctlr.c

deps_/root/tenonos_works/tenon-inference/build/libukintctlr_gic/ukintctlr.o := \
    $(wildcard include/config/libukofw.h) \
    $(wildcard include/config/libukintctlr/gicv2.h) \
    $(wildcard include/config/libukintctlr/gicv3.h) \
    $(wildcard include/config/libukintctlr/test.h) \
    $(wildcard include/config/libuktest/all.h) \
  /root/tenonos_works/tenon-inference/build/libmusl/include/mq/include/errno.h \
  /root/tenonos_works/tenon-inference/build/libmusl/include/core/include/features.h \
  /root/tenonos_works/tenon-inference/build/libmusl/origin/musl-1.2.3//arch/generic/bits/errno.h \
  /root/tenonos_works/tenon/include/uk/config.h \
  /root/tenonos_works/tenon/lib/ukdebug/include/uk/assert.h \
    $(wildcard include/config/libukdebug/enable/assert.h) \
  /root/tenonos_works/tenon/include/uk/plat/bootstrap.h \
  /root/tenonos_works/tenon/include/uk/arch/types.h \
  /root/tenonos_works/tenon/arch/arm/arm64/include/uk/asm/intsizes.h \
  /root/tenonos_works/tenon/arch/arm/arm64/include/uk/asm/types.h \
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
  /root/tenonos_works/tenon-inference/build/libmusl/origin/musl-1.2.3//arch/aarch64/bits/alltypes.h \
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
  /root/tenonos_works/tenon/include/uk/arch/limits.h \
  /root/tenonos_works/tenon/arch/arm/arm64/include/uk/asm/limits.h \
    $(wildcard include/config/stack/size/page/order.h) \
    $(wildcard include/config/cpu/except/stack/size/page/order.h) \
  /root/tenonos_works/tenon-inference/build/libuklibid/include/uk/bits/libid.h \
  /root/tenonos_works/tenon/lib/ukintctlr/include/uk/intctlr.h \
  /root/tenonos_works/tenon-inference/build/libmusl/include/core/include/stdbool.h \
  /root/tenonos_works/tenon/lib/ukalloc/include/uk/alloc.h \
    $(wildcard include/config/libukalloc/ifstats.h) \
    $(wildcard include/config/libukalloc/ifmalloc.h) \
    $(wildcard include/config/libukalloc/ifstats/perlib.h) \
    $(wildcard include/config/libukalloc/ifstats/global.h) \
  /root/tenonos_works/tenon/include/uk/plat/lcpu.h \
    $(wildcard include/config/have/smp.h) \
    $(wildcard include/config/ukplat/lcpu/maxcount.h) \
  /root/tenonos_works/tenon/include/uk/arch/time.h \
  /root/tenonos_works/tenon/include/uk/plat/offset.h \
  /root/tenonos_works/tenon/include/uk/plat/spinlock.h \
  /root/tenonos_works/tenon/include/uk/arch/spinlock.h \
  /root/tenonos_works/tenon/include/uk/list.h \
  /root/tenonos_works/tenon/lib/ukatomic/include/uk/atomic.h \
  /root/tenonos_works/tenon-inference/build/libmusl/include/dirent/include/stddef.h \
  /root/tenonos_works/tenon/include/uk/compat_list.h \
  /root/tenonos_works/tenon/drivers/ukintctlr/gic/include/uk/intctlr/limits.h \
  /root/tenonos_works/tenon/drivers/ukintctlr/gic/include/uk/intctlr/gic-v2.h \
  /root/tenonos_works/tenon/drivers/ukintctlr/gic/include/uk/intctlr/gic.h \
    $(wildcard include/config/priority/max/16.h) \
    $(wildcard include/config/priority/max/32.h) \
    $(wildcard include/config/priority/max/64.h) \
    $(wildcard include/config/priority/max/128.h) \
    $(wildcard include/config/ukplat/acpi.h) \
  /root/tenonos_works/tenon/drivers/ukintctlr/gic/include/uk/intctlr/gic-v3.h \
    $(wildcard include/config/virtualize/plat.h) \
  /root/tenonos_works/tenon/lib/fdt/include/libfdt.h \
  /root/tenonos_works/tenon/lib/fdt/include/libfdt_env.h \
  /root/tenonos_works/tenon-inference/build/libmusl/include/dirent/include/stdlib.h \
  /root/tenonos_works/tenon-inference/build/libmusl/include/core/include/alloca.h \
  /root/tenonos_works/tenon-inference/build/libmusl/include/dirent/include/string.h \
  /root/tenonos_works/tenon-inference/build/libmusl/include/misc/include/strings.h \
  /root/tenonos_works/tenon-inference/build/libmusl/include/core/include/limits.h \
  /root/tenonos_works/tenon-inference/build/libmusl/origin/musl-1.2.3//arch/generic/bits/limits.h \
  /root/tenonos_works/tenon/lib/fdt/include/fdt.h \
  /root/tenonos_works/tenon/lib/ukofw/include/uk/ofw/fdt.h \

/root/tenonos_works/tenon-inference/build/libukintctlr_gic/ukintctlr.o: $(deps_/root/tenonos_works/tenon-inference/build/libukintctlr_gic/ukintctlr.o)

$(deps_/root/tenonos_works/tenon-inference/build/libukintctlr_gic/ukintctlr.o):
