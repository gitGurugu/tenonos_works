cmd_/home/curryking/tenonos_work/tenon-inference/build/libnolibc/strsignal.o := /bin/bash /home/curryking/tenonos_work/tenon-inference/build/libnolibc/strsignal.o.cmd

source_/home/curryking/tenonos_work/tenon-inference/build/libnolibc/strsignal.o := /home/curryking/tenonos_work/tenon/lib/nolibc/musl-imported/src/string/strsignal.c

deps_/home/curryking/tenonos_work/tenon-inference/build/libnolibc/strsignal.o := \
  /home/curryking/tenonos_work/tenon/include/uk/essentials.h \
    $(wildcard include/config/libnewlibc.h) \
    $(wildcard include/config/have/sched.h) \
  /home/curryking/tenonos_work/tenon/include/uk/config.h \
  /home/curryking/tenonos_work/tenon/include/uk/compiler.h \
  /home/curryking/tenonos_work/tenon/arch/arm/arm64/include/uk/asm/compiler.h \
    $(wildcard include/config/arm64/feat/pauth.h) \
    $(wildcard include/config/arm64/feat/bti.h) \
  /home/curryking/tenonos_work/tenon/include/uk/arch/types.h \
  /home/curryking/tenonos_work/tenon/arch/arm/arm64/include/uk/asm/intsizes.h \
  /home/curryking/tenonos_work/tenon/arch/arm/arm64/include/uk/asm/types.h \
  /home/curryking/tenonos_work/tenon/lib/nolibc/include/string.h \
  /home/curryking/tenonos_work/tenon/lib/nolibc/include/nolibc-internal/shareddefs.h \
  /home/curryking/tenonos_work/tenon/lib/nolibc/musl-imported/include/signal.h \
  /home/curryking/tenonos_work/tenon/lib/nolibc/include/stddef.h \

/home/curryking/tenonos_work/tenon-inference/build/libnolibc/strsignal.o: $(deps_/home/curryking/tenonos_work/tenon-inference/build/libnolibc/strsignal.o)

$(deps_/home/curryking/tenonos_work/tenon-inference/build/libnolibc/strsignal.o):
