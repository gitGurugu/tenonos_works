cmd_/home/curryking/tenonos_work/tenon-inference/build/libnolibc/timegm.o := /bin/bash /home/curryking/tenonos_work/tenon-inference/build/libnolibc/timegm.o.cmd

source_/home/curryking/tenonos_work/tenon-inference/build/libnolibc/timegm.o := /home/curryking/tenonos_work/tenon/lib/nolibc/musl-imported/src/time/timegm.c

deps_/home/curryking/tenonos_work/tenon-inference/build/libnolibc/timegm.o := \
    $(wildcard include/config/libnewlibc.h) \
  /home/curryking/tenonos_work/tenon/include/uk/config.h \
  /home/curryking/tenonos_work/tenon/lib/nolibc/musl-imported/src/time/time_impl.h \
  /home/curryking/tenonos_work/tenon/lib/nolibc/musl-imported/include/time.h \
  /home/curryking/tenonos_work/tenon/lib/nolibc/include/nolibc-internal/shareddefs.h \
  /home/curryking/tenonos_work/tenon/include/uk/arch/types.h \
  /home/curryking/tenonos_work/tenon/arch/arm/arm64/include/uk/asm/intsizes.h \
  /home/curryking/tenonos_work/tenon/arch/arm/arm64/include/uk/asm/types.h \
  /home/curryking/tenonos_work/tenon/lib/nolibc/include/sys/types.h \
  /home/curryking/tenonos_work/tenon/lib/nolibc/include/errno.h \
    $(wildcard include/config/have/sched.h) \

/home/curryking/tenonos_work/tenon-inference/build/libnolibc/timegm.o: $(deps_/home/curryking/tenonos_work/tenon-inference/build/libnolibc/timegm.o)

$(deps_/home/curryking/tenonos_work/tenon-inference/build/libnolibc/timegm.o):
