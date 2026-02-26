cmd_/home/curryking/tenonos_work/tenon-inference/build/libcontext/ctx.arm64.o := /bin/bash /home/curryking/tenonos_work/tenon-inference/build/libcontext/ctx.arm64.o.cmd

source_/home/curryking/tenonos_work/tenon-inference/build/libcontext/ctx.arm64.o := /home/curryking/tenonos_work/tenon/arch/arm/arm64/ctx.S

deps_/home/curryking/tenonos_work/tenon-inference/build/libcontext/ctx.arm64.o := \
  /home/curryking/tenonos_work/tenon/include/uk/arch/ctx.h \
    $(wildcard include/config/libukdebug.h) \
    $(wildcard include/config/arch/x86/64.h) \
  /home/curryking/tenonos_work/tenon/include/uk/arch/types.h \
  /home/curryking/tenonos_work/tenon/arch/arm/arm64/include/uk/asm/intsizes.h \
  /home/curryking/tenonos_work/tenon/arch/arm/arm64/include/uk/asm/types.h \
  /home/curryking/tenonos_work/tenon/arch/arm/arm64/include/uk/asm/ctx.h \
  /home/curryking/tenonos_work/tenon/include/uk/essentials.h \
    $(wildcard include/config/libnewlibc.h) \
    $(wildcard include/config/have/sched.h) \
  /home/curryking/tenonos_work/tenon/include/uk/config.h \
  /home/curryking/tenonos_work/tenon/include/uk/arch/lcpu.h \
  /home/curryking/tenonos_work/tenon/arch/arm/arm64/include/uk/asm/lcpu.h \
    $(wildcard include/config/arm64/feat/mte.h) \
    $(wildcard include/config/arm64/feat/bti.h) \
    $(wildcard include/config/paging.h) \
  /home/curryking/tenonos_work/tenon/include/uk/asm.h \
  /home/curryking/tenonos_work/tenon/arch/arm/arm64/include/uk/asm/arch.h \

/home/curryking/tenonos_work/tenon-inference/build/libcontext/ctx.arm64.o: $(deps_/home/curryking/tenonos_work/tenon-inference/build/libcontext/ctx.arm64.o)

$(deps_/home/curryking/tenonos_work/tenon-inference/build/libcontext/ctx.arm64.o):
