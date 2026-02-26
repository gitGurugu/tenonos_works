cmd_/home/curryking/tenonos_work/tenon-inference/build/libkvmplat/entry64.isr.o := /bin/bash /home/curryking/tenonos_work/tenon-inference/build/libkvmplat/entry64.isr.o.cmd

source_/home/curryking/tenonos_work/tenon-inference/build/libkvmplat/entry64.isr.o := /home/curryking/tenonos_work/tenon/plat/kvm/arm/entry64.S

deps_/home/curryking/tenonos_work/tenon-inference/build/libkvmplat/entry64.isr.o := \
    $(wildcard include/config/ukplat/lcpu/maxcount.h) \
    $(wildcard include/config/kvm/boot/proto/lxboot.h) \
    $(wildcard include/config/fpsimd.h) \
    $(wildcard include/config/libukreloc.h) \
    $(wildcard include/config/kvm/boot/proto/qemu/virt.h) \
  /home/curryking/tenonos_work/tenon/include/uk/arch/lcpu.h \
  /home/curryking/tenonos_work/tenon/arch/arm/arm64/include/uk/asm/lcpu.h \
    $(wildcard include/config/arm64/feat/mte.h) \
    $(wildcard include/config/arm64/feat/bti.h) \
    $(wildcard include/config/paging.h) \
  /home/curryking/tenonos_work/tenon/include/uk/asm.h \
  /home/curryking/tenonos_work/tenon/arch/arm/arm64/include/uk/asm/arch.h \
  /home/curryking/tenonos_work/tenon/include/uk/config.h \
  /home/curryking/tenonos_work/tenon/include/uk/essentials.h \
    $(wildcard include/config/libnewlibc.h) \
    $(wildcard include/config/have/sched.h) \
  /home/curryking/tenonos_work/tenon/include/uk/arch/limits.h \
  /home/curryking/tenonos_work/tenon/arch/arm/arm64/include/uk/asm/limits.h \
    $(wildcard include/config/stack/size/page/order.h) \
    $(wildcard include/config/cpu/except/stack/size/page/order.h) \
  /home/curryking/tenonos_work/tenon/plat/common/include/uk/plat/common/sections.h \
  /home/curryking/tenonos_work/tenon/lib/ukreloc/include/uk/reloc.h \
  /home/curryking/tenonos_work/tenon/lib/ukreloc/arch/arm64/include/uk/asm/reloc.h \

/home/curryking/tenonos_work/tenon-inference/build/libkvmplat/entry64.isr.o: $(deps_/home/curryking/tenonos_work/tenon-inference/build/libkvmplat/entry64.isr.o)

$(deps_/home/curryking/tenonos_work/tenon-inference/build/libkvmplat/entry64.isr.o):
