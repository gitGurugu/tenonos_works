cmd_/root/tenonos_works/tenon-inference/build/libkvmplat/smccc_invoke.common.o := /bin/bash /root/tenonos_works/tenon-inference/build/libkvmplat/smccc_invoke.common.o.cmd

source_/root/tenonos_works/tenon-inference/build/libkvmplat/smccc_invoke.common.o := /root/tenonos_works/tenon/plat/common/arm/smccc_invoke.S

deps_/root/tenonos_works/tenon-inference/build/libkvmplat/smccc_invoke.common.o := \
    $(wildcard include/config/arch/arm/64.h) \
    $(wildcard include/config/arm64/feat/pauth.h) \
    $(wildcard include/config/arm64/feat/bti.h) \
  /root/tenonos_works/tenon/plat/common/include/arm/smccc.h \
  /root/tenonos_works/tenon/include/uk/config.h \
  /root/tenonos_works/tenon/include/uk/asm.h \

/root/tenonos_works/tenon-inference/build/libkvmplat/smccc_invoke.common.o: $(deps_/root/tenonos_works/tenon-inference/build/libkvmplat/smccc_invoke.common.o)

$(deps_/root/tenonos_works/tenon-inference/build/libkvmplat/smccc_invoke.common.o):
