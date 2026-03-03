cmd_/root/tenonos_works/tenon-inference/build/libkvmplat/io.o := /bin/bash /root/tenonos_works/tenon-inference/build/libkvmplat/io.o.cmd

source_/root/tenonos_works/tenon-inference/build/libkvmplat/io.o := /root/tenonos_works/tenon/plat/kvm/io.c

deps_/root/tenonos_works/tenon-inference/build/libkvmplat/io.o := \
    $(wildcard include/config/paging.h) \
  /root/tenonos_works/tenon/include/uk/plat/io.h \
  /root/tenonos_works/tenon/include/uk/arch/types.h \
  /root/tenonos_works/tenon/arch/arm/arm64/include/uk/asm/intsizes.h \
  /root/tenonos_works/tenon/arch/arm/arm64/include/uk/asm/types.h \
  /root/tenonos_works/tenon/include/uk/config.h \

/root/tenonos_works/tenon-inference/build/libkvmplat/io.o: $(deps_/root/tenonos_works/tenon-inference/build/libkvmplat/io.o)

$(deps_/root/tenonos_works/tenon-inference/build/libkvmplat/io.o):
