cmd_/home/curryking/tenonos_work/tenon-inference/build/libkvmplat/exceptions64.isr.o := /bin/bash /home/curryking/tenonos_work/tenon-inference/build/libkvmplat/exceptions64.isr.o.cmd

source_/home/curryking/tenonos_work/tenon-inference/build/libkvmplat/exceptions64.isr.o := /home/curryking/tenonos_work/tenon/plat/common/arm/exceptions64.S

deps_/home/curryking/tenonos_work/tenon-inference/build/libkvmplat/exceptions64.isr.o := \
    $(wildcard include/config/have/sched.h) \
  /home/curryking/tenonos_work/tenon/include/uk/plat/offset.h \
    $(wildcard include/config/have/smp.h) \
  /home/curryking/tenonos_work/tenon/include/uk/config.h \
  /home/curryking/tenonos_work/tenon/include/uk/essentials.h \
    $(wildcard include/config/libnewlibc.h) \
  /home/curryking/tenonos_work/tenon/include/uk/arch/lcpu.h \
  /home/curryking/tenonos_work/tenon/arch/arm/arm64/include/uk/asm/lcpu.h \
    $(wildcard include/config/arm64/feat/mte.h) \
    $(wildcard include/config/arm64/feat/bti.h) \
    $(wildcard include/config/paging.h) \
  /home/curryking/tenonos_work/tenon/include/uk/asm.h \
  /home/curryking/tenonos_work/tenon/arch/arm/arm64/include/uk/asm/arch.h \
  /home/curryking/tenonos_work/tenon/lib/syscall_shim/include/uk/syscall.h \
    $(wildcard include/config/libsyscall/shim.h) \
    $(wildcard include/config/libsyscall/shim/nowrapper.h) \
    $(wildcard include/config/libsyscall/shim/debug/syscalls.h) \
    $(wildcard include/config/libukdebug/printd.h) \
    $(wildcard include/config/libsyscall/shim/debug.h) \
  /home/curryking/tenonos_work/tenon/include/uk/arch/ctx.h \
    $(wildcard include/config/libukdebug.h) \
    $(wildcard include/config/arch/x86/64.h) \
  /home/curryking/tenonos_work/tenon/include/uk/arch/types.h \
  /home/curryking/tenonos_work/tenon/arch/arm/arm64/include/uk/asm/intsizes.h \
  /home/curryking/tenonos_work/tenon/arch/arm/arm64/include/uk/asm/types.h \
  /home/curryking/tenonos_work/tenon/arch/arm/arm64/include/uk/asm/ctx.h \
  /home/curryking/tenonos_work/tenon/lib/syscall_shim/arch/arm64/include/arch/sysregs.h \
    $(wildcard include/config/libsyscall/shim/handler/ultls.h) \
  /home/curryking/tenonos_work/tenon/lib/syscall_shim/arch/arm64/include/arch/regmap_usc.h \
  /home/curryking/tenonos_work/tenon/lib/syscall_shim/arch/arm64/include/arch/syscall_prologue.h \

/home/curryking/tenonos_work/tenon-inference/build/libkvmplat/exceptions64.isr.o: $(deps_/home/curryking/tenonos_work/tenon-inference/build/libkvmplat/exceptions64.isr.o)

$(deps_/home/curryking/tenonos_work/tenon-inference/build/libkvmplat/exceptions64.isr.o):
