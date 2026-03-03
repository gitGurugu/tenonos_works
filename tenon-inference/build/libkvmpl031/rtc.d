cmd_/root/tenonos_works/tenon-inference/build/libkvmpl031/rtc.o := /bin/bash /root/tenonos_works/tenon-inference/build/libkvmpl031/rtc.o.cmd

source_/root/tenonos_works/tenon-inference/build/libkvmpl031/rtc.o := /root/tenonos_works/tenon/plat/drivers/rtc/rtc.c

deps_/root/tenonos_works/tenon-inference/build/libkvmpl031/rtc.o := \
  /root/tenonos_works/tenon/include/uk/essentials.h \
    $(wildcard include/config/libnewlibc.h) \
    $(wildcard include/config/have/sched.h) \
  /root/tenonos_works/tenon/include/uk/config.h \
  /root/tenonos_works/tenon/include/uk/compiler.h \
  /root/tenonos_works/tenon/arch/arm/arm64/include/uk/asm/compiler.h \
    $(wildcard include/config/arm64/feat/pauth.h) \
    $(wildcard include/config/arm64/feat/bti.h) \
  /root/tenonos_works/tenon/include/uk/arch/types.h \
  /root/tenonos_works/tenon/arch/arm/arm64/include/uk/asm/intsizes.h \
  /root/tenonos_works/tenon/arch/arm/arm64/include/uk/asm/types.h \
  /root/tenonos_works/tenon/plat/drivers/include/rtc/rtc.h \

/root/tenonos_works/tenon-inference/build/libkvmpl031/rtc.o: $(deps_/root/tenonos_works/tenon-inference/build/libkvmpl031/rtc.o)

$(deps_/root/tenonos_works/tenon-inference/build/libkvmpl031/rtc.o):
