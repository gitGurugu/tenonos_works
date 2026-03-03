cmd_/root/tenonos_works/tenon-inference/build/libuklibid/selfids.o := /bin/bash /root/tenonos_works/tenon-inference/build/libuklibid/selfids.o.cmd

source_/root/tenonos_works/tenon-inference/build/libuklibid/selfids.o := /root/tenonos_works/tenon-inference/build/libuklibid/selfids.c

deps_/root/tenonos_works/tenon-inference/build/libuklibid/selfids.o := \
  /root/tenonos_works/tenon/lib/uklibid/include/uk/libid.h \
    $(wildcard include/config/have/libc.h) \
    $(wildcard include/config/libnolibc.h) \
  /root/tenonos_works/tenon/include/uk/arch/limits.h \
  /root/tenonos_works/tenon/include/uk/config.h \
  /root/tenonos_works/tenon/arch/arm/arm64/include/uk/asm/limits.h \
    $(wildcard include/config/stack/size/page/order.h) \
    $(wildcard include/config/cpu/except/stack/size/page/order.h) \
  /root/tenonos_works/tenon/arch/arm/arm64/include/uk/asm/intsizes.h \
  /root/tenonos_works/tenon/include/uk/arch/types.h \
  /root/tenonos_works/tenon/arch/arm/arm64/include/uk/asm/types.h \
  /root/tenonos_works/tenon-inference/build/libuklibid/include/uk/bits/libid.h \

/root/tenonos_works/tenon-inference/build/libuklibid/selfids.o: $(deps_/root/tenonos_works/tenon-inference/build/libuklibid/selfids.o)

$(deps_/root/tenonos_works/tenon-inference/build/libuklibid/selfids.o):
