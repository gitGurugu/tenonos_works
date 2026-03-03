cmd_/root/tenonos_works/tenon-inference/build/libkvmplat/smccc.common.o := /bin/bash /root/tenonos_works/tenon-inference/build/libkvmplat/smccc.common.o.cmd

source_/root/tenonos_works/tenon-inference/build/libkvmplat/smccc.common.o := /root/tenonos_works/tenon/plat/common/arm/smccc.c

deps_/root/tenonos_works/tenon-inference/build/libkvmplat/smccc.common.o := \
    $(wildcard include/config/fpsimd.h) \
  /root/tenonos_works/tenon/plat/common/include/arm/smccc.h \
    $(wildcard include/config/arch/arm/64.h) \
  /root/tenonos_works/tenon/include/uk/config.h \

/root/tenonos_works/tenon-inference/build/libkvmplat/smccc.common.o: $(deps_/root/tenonos_works/tenon-inference/build/libkvmplat/smccc.common.o)

$(deps_/root/tenonos_works/tenon-inference/build/libkvmplat/smccc.common.o):
