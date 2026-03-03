cmd_/root/tenonos_works/tenon-inference/build/libkvmplat/link64.lds := /bin/bash /root/tenonos_works/tenon-inference/build/libkvmplat/link64.lds.cmd

source_/root/tenonos_works/tenon-inference/build/libkvmplat/link64.lds := /root/tenonos_works/tenon/plat/kvm/arm/link64.lds.S

deps_/root/tenonos_works/tenon-inference/build/libkvmplat/link64.lds := \
    $(wildcard include/config/static/pgtable.h) \
  /root/tenonos_works/tenon/include/uk/arch/limits.h \
  /root/tenonos_works/tenon/include/uk/config.h \
  /root/tenonos_works/tenon/arch/arm/arm64/include/uk/asm/limits.h \
    $(wildcard include/config/stack/size/page/order.h) \
    $(wildcard include/config/cpu/except/stack/size/page/order.h) \
  /root/tenonos_works/tenon/plat/common/include/uk/plat/common/common.lds.h \
  /root/tenonos_works/tenon/plat/kvm/include/kvm-arm64/image.h \
    $(wildcard include/config/kvm/vmm/qemu.h) \

/root/tenonos_works/tenon-inference/build/libkvmplat/link64.lds: $(deps_/root/tenonos_works/tenon-inference/build/libkvmplat/link64.lds)

$(deps_/root/tenonos_works/tenon-inference/build/libkvmplat/link64.lds):
