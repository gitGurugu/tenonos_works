cmd_/home/curryking/tenonos_work/tenon-inference/build/libkvmplat/link64.lds := /bin/bash /home/curryking/tenonos_work/tenon-inference/build/libkvmplat/link64.lds.cmd

source_/home/curryking/tenonos_work/tenon-inference/build/libkvmplat/link64.lds := /home/curryking/tenonos_work/tenon/plat/kvm/arm/link64.lds.S

deps_/home/curryking/tenonos_work/tenon-inference/build/libkvmplat/link64.lds := \
    $(wildcard include/config/static/pgtable.h) \
  /home/curryking/tenonos_work/tenon/include/uk/arch/limits.h \
  /home/curryking/tenonos_work/tenon/include/uk/config.h \
  /home/curryking/tenonos_work/tenon/arch/arm/arm64/include/uk/asm/limits.h \
    $(wildcard include/config/stack/size/page/order.h) \
    $(wildcard include/config/cpu/except/stack/size/page/order.h) \
  /home/curryking/tenonos_work/tenon/plat/common/include/uk/plat/common/common.lds.h \
  /home/curryking/tenonos_work/tenon/plat/kvm/include/kvm-arm64/image.h \
    $(wildcard include/config/kvm/vmm/qemu.h) \

/home/curryking/tenonos_work/tenon-inference/build/libkvmplat/link64.lds: $(deps_/home/curryking/tenonos_work/tenon-inference/build/libkvmplat/link64.lds)

$(deps_/home/curryking/tenonos_work/tenon-inference/build/libkvmplat/link64.lds):
