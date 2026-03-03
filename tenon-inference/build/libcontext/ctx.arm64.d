cmd_/root/tenonos_works/tenon-inference/build/libcontext/ctx.arm64.o := /bin/bash /root/tenonos_works/tenon-inference/build/libcontext/ctx.arm64.o.cmd

source_/root/tenonos_works/tenon-inference/build/libcontext/ctx.arm64.o := /root/tenonos_works/tenon/arch/arm/arm64/ctx.S

deps_/root/tenonos_works/tenon-inference/build/libcontext/ctx.arm64.o := \
  /root/tenonos_works/tenon/include/uk/arch/ctx.h \
    $(wildcard include/config/libukdebug.h) \
    $(wildcard include/config/arch/x86/64.h) \
  /root/tenonos_works/tenon/include/uk/arch/types.h \
  /root/tenonos_works/tenon/arch/arm/arm64/include/uk/asm/intsizes.h \
  /root/tenonos_works/tenon/arch/arm/arm64/include/uk/asm/types.h \
  /root/tenonos_works/tenon/arch/arm/arm64/include/uk/asm/ctx.h \
  /root/tenonos_works/tenon/include/uk/essentials.h \
    $(wildcard include/config/libnewlibc.h) \
    $(wildcard include/config/have/sched.h) \
  /root/tenonos_works/tenon/include/uk/config.h \
  /root/tenonos_works/tenon/include/uk/arch/lcpu.h \
  /root/tenonos_works/tenon/arch/arm/arm64/include/uk/asm/lcpu.h \
    $(wildcard include/config/arm64/feat/mte.h) \
    $(wildcard include/config/arm64/feat/bti.h) \
    $(wildcard include/config/paging.h) \
  /root/tenonos_works/tenon/include/uk/asm.h \
  /root/tenonos_works/tenon/arch/arm/arm64/include/uk/asm/arch.h \

/root/tenonos_works/tenon-inference/build/libcontext/ctx.arm64.o: $(deps_/root/tenonos_works/tenon-inference/build/libcontext/ctx.arm64.o)

$(deps_/root/tenonos_works/tenon-inference/build/libcontext/ctx.arm64.o):
