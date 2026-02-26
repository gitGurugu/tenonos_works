cmd_/home/curryking/tenonos_work/tenon-inference/build/libkvmplat/cache64.common.o := /bin/bash /home/curryking/tenonos_work/tenon-inference/build/libkvmplat/cache64.common.o.cmd

source_/home/curryking/tenonos_work/tenon-inference/build/libkvmplat/cache64.common.o := /home/curryking/tenonos_work/tenon/plat/common/arm/cache64.S

deps_/home/curryking/tenonos_work/tenon-inference/build/libkvmplat/cache64.common.o := \
  /home/curryking/tenonos_work/tenon/include/uk/arch/lcpu.h \
  /home/curryking/tenonos_work/tenon/arch/arm/arm64/include/uk/asm/lcpu.h \
    $(wildcard include/config/arm64/feat/mte.h) \
    $(wildcard include/config/arm64/feat/bti.h) \
    $(wildcard include/config/paging.h) \
  /home/curryking/tenonos_work/tenon/include/uk/asm.h \
  /home/curryking/tenonos_work/tenon/arch/arm/arm64/include/uk/asm/arch.h \
  /home/curryking/tenonos_work/tenon/include/uk/config.h \
  /home/curryking/tenonos_work/tenon/include/uk/essentials.h \
    $(wildcard include/config/libnewlibc.h) \
    $(wildcard include/config/have/sched.h) \

/home/curryking/tenonos_work/tenon-inference/build/libkvmplat/cache64.common.o: $(deps_/home/curryking/tenonos_work/tenon-inference/build/libkvmplat/cache64.common.o)

$(deps_/home/curryking/tenonos_work/tenon-inference/build/libkvmplat/cache64.common.o):
