cmd_/root/tenonos_works/tenon-inference/build/libkvmplat/lcpu_start.o := /bin/bash /root/tenonos_works/tenon-inference/build/libkvmplat/lcpu_start.o.cmd

source_/root/tenonos_works/tenon-inference/build/libkvmplat/lcpu_start.o := /root/tenonos_works/tenon/plat/common/arm/lcpu_start.S

deps_/root/tenonos_works/tenon-inference/build/libkvmplat/lcpu_start.o := \
  /root/tenonos_works/tenon/plat/common/include/arm/switch_el.h \
  /root/tenonos_works/tenon/include/uk/asm.h \
  /root/tenonos_works/tenon/include/uk/plat/offset.h \
    $(wildcard include/config/have/smp.h) \
    $(wildcard include/config/have/sched.h) \
  /root/tenonos_works/tenon/include/uk/config.h \
  /root/tenonos_works/tenon/include/uk/essentials.h \
    $(wildcard include/config/libnewlibc.h) \
  /root/tenonos_works/tenon/include/uk/arch/lcpu.h \
  /root/tenonos_works/tenon/arch/arm/arm64/include/uk/asm/lcpu.h \
    $(wildcard include/config/arm64/feat/mte.h) \
    $(wildcard include/config/arm64/feat/bti.h) \
    $(wildcard include/config/paging.h) \
  /root/tenonos_works/tenon/arch/arm/arm64/include/uk/asm/arch.h \
  /root/tenonos_works/tenon/lib/ukreloc/include/uk/reloc.h \
    $(wildcard include/config/libukreloc.h) \
  /root/tenonos_works/tenon/lib/ukreloc/arch/arm64/include/uk/asm/reloc.h \

/root/tenonos_works/tenon-inference/build/libkvmplat/lcpu_start.o: $(deps_/root/tenonos_works/tenon-inference/build/libkvmplat/lcpu_start.o)

$(deps_/root/tenonos_works/tenon-inference/build/libkvmplat/lcpu_start.o):
