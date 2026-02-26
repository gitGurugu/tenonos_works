cmd_/home/curryking/tenonos_work/tenon-inference/build/libkvmplat/io.o := /bin/bash /home/curryking/tenonos_work/tenon-inference/build/libkvmplat/io.o.cmd

source_/home/curryking/tenonos_work/tenon-inference/build/libkvmplat/io.o := /home/curryking/tenonos_work/tenon/plat/kvm/io.c

deps_/home/curryking/tenonos_work/tenon-inference/build/libkvmplat/io.o := \
    $(wildcard include/config/paging.h) \
  /home/curryking/tenonos_work/tenon/include/uk/plat/io.h \
  /home/curryking/tenonos_work/tenon/include/uk/arch/types.h \
  /home/curryking/tenonos_work/tenon/arch/arm/arm64/include/uk/asm/intsizes.h \
  /home/curryking/tenonos_work/tenon/arch/arm/arm64/include/uk/asm/types.h \
  /home/curryking/tenonos_work/tenon/include/uk/config.h \

/home/curryking/tenonos_work/tenon-inference/build/libkvmplat/io.o: $(deps_/home/curryking/tenonos_work/tenon-inference/build/libkvmplat/io.o)

$(deps_/home/curryking/tenonos_work/tenon-inference/build/libkvmplat/io.o):
