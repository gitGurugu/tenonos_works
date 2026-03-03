cmd_/root/tenonos_works/tenon-inference/build/libukboot_main/weak_main.o := /bin/bash /root/tenonos_works/tenon-inference/build/libukboot_main/weak_main.o.cmd

source_/root/tenonos_works/tenon-inference/build/libukboot_main/weak_main.o := /root/tenonos_works/tenon/lib/ukboot/weak_main.c

deps_/root/tenonos_works/tenon-inference/build/libukboot_main/weak_main.o := \
  /root/tenonos_works/tenon-inference/build/libmusl/include/misc/include/stdio.h \
  /root/tenonos_works/tenon-inference/build/libmusl/include/core/include/features.h \
  /root/tenonos_works/tenon-inference/build/libmusl/origin/musl-1.2.3//arch/aarch64/bits/alltypes.h \
  /root/tenonos_works/tenon-inference/build/libmusl/include/mq/include/errno.h \
  /root/tenonos_works/tenon-inference/build/libmusl/origin/musl-1.2.3//arch/generic/bits/errno.h \
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

/root/tenonos_works/tenon-inference/build/libukboot_main/weak_main.o: $(deps_/root/tenonos_works/tenon-inference/build/libukboot_main/weak_main.o)

$(deps_/root/tenonos_works/tenon-inference/build/libukboot_main/weak_main.o):
