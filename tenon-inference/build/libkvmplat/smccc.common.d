cmd_/home/curryking/tenonos_work/tenon-inference/build/libkvmplat/smccc.common.o := /bin/bash /home/curryking/tenonos_work/tenon-inference/build/libkvmplat/smccc.common.o.cmd

source_/home/curryking/tenonos_work/tenon-inference/build/libkvmplat/smccc.common.o := /home/curryking/tenonos_work/tenon/plat/common/arm/smccc.c

deps_/home/curryking/tenonos_work/tenon-inference/build/libkvmplat/smccc.common.o := \
    $(wildcard include/config/fpsimd.h) \
  /home/curryking/tenonos_work/tenon/plat/common/include/arm/smccc.h \
    $(wildcard include/config/arch/arm/64.h) \
  /home/curryking/tenonos_work/tenon/include/uk/config.h \

/home/curryking/tenonos_work/tenon-inference/build/libkvmplat/smccc.common.o: $(deps_/home/curryking/tenonos_work/tenon-inference/build/libkvmplat/smccc.common.o)

$(deps_/home/curryking/tenonos_work/tenon-inference/build/libkvmplat/smccc.common.o):
