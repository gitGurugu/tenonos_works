cmd_/root/tenonos_works/tenon-inference/build/libkvmplat/exceptions64.isr.o := /bin/bash /root/tenonos_works/tenon-inference/build/libkvmplat/exceptions64.isr.o.cmd

source_/root/tenonos_works/tenon-inference/build/libkvmplat/exceptions64.isr.o := /root/tenonos_works/tenon/plat/common/arm/exceptions64.S

deps_/root/tenonos_works/tenon-inference/build/libkvmplat/exceptions64.isr.o := \
    $(wildcard include/config/have/sched.h) \
  /root/tenonos_works/tenon/include/uk/plat/offset.h \
    $(wildcard include/config/have/smp.h) \
  /root/tenonos_works/tenon/include/uk/config.h \
  /root/tenonos_works/tenon/include/uk/essentials.h \
    $(wildcard include/config/libnewlibc.h) \
  /root/tenonos_works/tenon/include/uk/arch/lcpu.h \
  /root/tenonos_works/tenon/arch/arm/arm64/include/uk/asm/lcpu.h \
    $(wildcard include/config/arm64/feat/mte.h) \
    $(wildcard include/config/arm64/feat/bti.h) \
    $(wildcard include/config/paging.h) \
  /root/tenonos_works/tenon/include/uk/asm.h \
  /root/tenonos_works/tenon/arch/arm/arm64/include/uk/asm/arch.h \
  /root/tenonos_works/tenon/lib/syscall_shim/include/uk/syscall.h \
    $(wildcard include/config/libsyscall/shim.h) \
    $(wildcard include/config/libsyscall/shim/nowrapper.h) \
    $(wildcard include/config/libsyscall/shim/debug/syscalls.h) \
    $(wildcard include/config/libukdebug/printd.h) \
    $(wildcard include/config/libsyscall/shim/debug.h) \
  /root/tenonos_works/tenon/include/uk/arch/ctx.h \
    $(wildcard include/config/libukdebug.h) \
    $(wildcard include/config/arch/x86/64.h) \
  /root/tenonos_works/tenon/include/uk/arch/types.h \
  /root/tenonos_works/tenon/arch/arm/arm64/include/uk/asm/intsizes.h \
  /root/tenonos_works/tenon/arch/arm/arm64/include/uk/asm/types.h \
  /root/tenonos_works/tenon/arch/arm/arm64/include/uk/asm/ctx.h \
  /root/tenonos_works/tenon/lib/syscall_shim/arch/arm64/include/arch/sysregs.h \
    $(wildcard include/config/libsyscall/shim/handler/ultls.h) \
  /root/tenonos_works/tenon/lib/syscall_shim/arch/arm64/include/arch/regmap_usc.h \
  /root/tenonos_works/tenon/lib/syscall_shim/arch/arm64/include/arch/syscall_prologue.h \

/root/tenonos_works/tenon-inference/build/libkvmplat/exceptions64.isr.o: $(deps_/root/tenonos_works/tenon-inference/build/libkvmplat/exceptions64.isr.o)

$(deps_/root/tenonos_works/tenon-inference/build/libkvmplat/exceptions64.isr.o):
