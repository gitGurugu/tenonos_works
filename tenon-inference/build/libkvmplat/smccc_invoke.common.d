cmd_/home/curryking/tenonos_work/tenon-inference/build/libkvmplat/smccc_invoke.common.o := /bin/bash /home/curryking/tenonos_work/tenon-inference/build/libkvmplat/smccc_invoke.common.o.cmd

source_/home/curryking/tenonos_work/tenon-inference/build/libkvmplat/smccc_invoke.common.o := /home/curryking/tenonos_work/tenon/plat/common/arm/smccc_invoke.S

deps_/home/curryking/tenonos_work/tenon-inference/build/libkvmplat/smccc_invoke.common.o := \
    $(wildcard include/config/arch/arm/64.h) \
    $(wildcard include/config/arm64/feat/pauth.h) \
    $(wildcard include/config/arm64/feat/bti.h) \
  /home/curryking/tenonos_work/tenon/plat/common/include/arm/smccc.h \
  /home/curryking/tenonos_work/tenon/include/uk/config.h \
  /home/curryking/tenonos_work/tenon/include/uk/asm.h \

/home/curryking/tenonos_work/tenon-inference/build/libkvmplat/smccc_invoke.common.o: $(deps_/home/curryking/tenonos_work/tenon-inference/build/libkvmplat/smccc_invoke.common.o)

$(deps_/home/curryking/tenonos_work/tenon-inference/build/libkvmplat/smccc_invoke.common.o):
