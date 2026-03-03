cmd_/root/tenonos_works/tenon-inference/build/libukboot/version.o := /bin/bash /root/tenonos_works/tenon-inference/build/libukboot/version.o.cmd

source_/root/tenonos_works/tenon-inference/build/libukboot/version.o := /root/tenonos_works/tenon/lib/ukboot/version.c

deps_/root/tenonos_works/tenon-inference/build/libukboot/version.o := \
  /root/tenonos_works/tenon/lib/ukboot/include/uk/version.h \
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
  /root/tenonos_works/tenon-inference/build/libmusl/include/misc/include/stdio.h \
  /root/tenonos_works/tenon-inference/build/libmusl/include/core/include/features.h \
  /root/tenonos_works/tenon-inference/build/libmusl/origin/musl-1.2.3//arch/aarch64/bits/alltypes.h \

/root/tenonos_works/tenon-inference/build/libukboot/version.o: $(deps_/root/tenonos_works/tenon-inference/build/libukboot/version.o)

$(deps_/root/tenonos_works/tenon-inference/build/libukboot/version.o):
