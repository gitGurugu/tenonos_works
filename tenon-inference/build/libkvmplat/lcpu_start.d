cmd_/home/curryking/tenonos_work/tenon-inference/build/libkvmplat/lcpu_start.o := /bin/bash /home/curryking/tenonos_work/tenon-inference/build/libkvmplat/lcpu_start.o.cmd

source_/home/curryking/tenonos_work/tenon-inference/build/libkvmplat/lcpu_start.o := /home/curryking/tenonos_work/tenon/plat/common/arm/lcpu_start.S

deps_/home/curryking/tenonos_work/tenon-inference/build/libkvmplat/lcpu_start.o := \
  /home/curryking/tenonos_work/tenon/plat/common/include/arm/switch_el.h \
  /home/curryking/tenonos_work/tenon/include/uk/asm.h \
  /home/curryking/tenonos_work/tenon/include/uk/plat/offset.h \
    $(wildcard include/config/have/smp.h) \
    $(wildcard include/config/have/sched.h) \
  /home/curryking/tenonos_work/tenon/include/uk/config.h \
  /home/curryking/tenonos_work/tenon/include/uk/essentials.h \
    $(wildcard include/config/libnewlibc.h) \
  /home/curryking/tenonos_work/tenon/include/uk/arch/lcpu.h \
  /home/curryking/tenonos_work/tenon/arch/arm/arm64/include/uk/asm/lcpu.h \
    $(wildcard include/config/arm64/feat/mte.h) \
    $(wildcard include/config/arm64/feat/bti.h) \
    $(wildcard include/config/paging.h) \
  /home/curryking/tenonos_work/tenon/arch/arm/arm64/include/uk/asm/arch.h \
  /home/curryking/tenonos_work/tenon/lib/ukreloc/include/uk/reloc.h \
    $(wildcard include/config/libukreloc.h) \
  /home/curryking/tenonos_work/tenon/lib/ukreloc/arch/arm64/include/uk/asm/reloc.h \

/home/curryking/tenonos_work/tenon-inference/build/libkvmplat/lcpu_start.o: $(deps_/home/curryking/tenonos_work/tenon-inference/build/libkvmplat/lcpu_start.o)

$(deps_/home/curryking/tenonos_work/tenon-inference/build/libkvmplat/lcpu_start.o):
