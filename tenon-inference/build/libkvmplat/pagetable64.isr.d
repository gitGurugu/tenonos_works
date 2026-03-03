cmd_/root/tenonos_works/tenon-inference/build/libkvmplat/pagetable64.isr.o := /bin/bash /root/tenonos_works/tenon-inference/build/libkvmplat/pagetable64.isr.o.cmd

source_/root/tenonos_works/tenon-inference/build/libkvmplat/pagetable64.isr.o := /root/tenonos_works/tenon/plat/kvm/arm/pagetable64.S

deps_/root/tenonos_works/tenon-inference/build/libkvmplat/pagetable64.isr.o := \
    $(wildcard include/config/paging.h) \
  /root/tenonos_works/tenon/include/uk/arch/lcpu.h \
  /root/tenonos_works/tenon/arch/arm/arm64/include/uk/asm/lcpu.h \
    $(wildcard include/config/arm64/feat/mte.h) \
    $(wildcard include/config/arm64/feat/bti.h) \
  /root/tenonos_works/tenon/include/uk/asm.h \
  /root/tenonos_works/tenon/arch/arm/arm64/include/uk/asm/arch.h \
  /root/tenonos_works/tenon/include/uk/config.h \
  /root/tenonos_works/tenon/include/uk/essentials.h \
    $(wildcard include/config/libnewlibc.h) \
    $(wildcard include/config/have/sched.h) \
  /root/tenonos_works/tenon/include/uk/arch/limits.h \
  /root/tenonos_works/tenon/arch/arm/arm64/include/uk/asm/limits.h \
    $(wildcard include/config/stack/size/page/order.h) \
    $(wildcard include/config/cpu/except/stack/size/page/order.h) \
  /root/tenonos_works/tenon/lib/ukreloc/include/uk/reloc.h \
    $(wildcard include/config/libukreloc.h) \
  /root/tenonos_works/tenon/lib/ukreloc/arch/arm64/include/uk/asm/reloc.h \

/root/tenonos_works/tenon-inference/build/libkvmplat/pagetable64.isr.o: $(deps_/root/tenonos_works/tenon-inference/build/libkvmplat/pagetable64.isr.o)

$(deps_/root/tenonos_works/tenon-inference/build/libkvmplat/pagetable64.isr.o):
