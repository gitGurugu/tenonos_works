cmd_/root/tenonos_works/tenon-inference/build/libkvmplat/cache64.common.o := /bin/bash /root/tenonos_works/tenon-inference/build/libkvmplat/cache64.common.o.cmd

source_/root/tenonos_works/tenon-inference/build/libkvmplat/cache64.common.o := /root/tenonos_works/tenon/plat/common/arm/cache64.S

deps_/root/tenonos_works/tenon-inference/build/libkvmplat/cache64.common.o := \
  /root/tenonos_works/tenon/include/uk/arch/lcpu.h \
  /root/tenonos_works/tenon/arch/arm/arm64/include/uk/asm/lcpu.h \
    $(wildcard include/config/arm64/feat/mte.h) \
    $(wildcard include/config/arm64/feat/bti.h) \
    $(wildcard include/config/paging.h) \
  /root/tenonos_works/tenon/include/uk/asm.h \
  /root/tenonos_works/tenon/arch/arm/arm64/include/uk/asm/arch.h \
  /root/tenonos_works/tenon/include/uk/config.h \
  /root/tenonos_works/tenon/include/uk/essentials.h \
    $(wildcard include/config/libnewlibc.h) \
    $(wildcard include/config/have/sched.h) \

/root/tenonos_works/tenon-inference/build/libkvmplat/cache64.common.o: $(deps_/root/tenonos_works/tenon-inference/build/libkvmplat/cache64.common.o)

$(deps_/root/tenonos_works/tenon-inference/build/libkvmplat/cache64.common.o):
