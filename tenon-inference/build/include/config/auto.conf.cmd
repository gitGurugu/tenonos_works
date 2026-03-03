deps_config := \
	/root/tenonos_works/tenon-inference/Config.uk \
	/root/tenonos_works/tenon-inference/build/kconfig/app.uk \
	/root/tenonos_works/libs/lib-libunwind-RELEASE-0.16.0/Config.uk \
	/root/tenonos_works/libs/lib-libcxx-RELEASE-0.16.0/Config.uk \
	/root/tenonos_works/libs/lib-libcxxabi-RELEASE-0.16.0/Config.uk \
	/root/tenonos_works/libs/lib-musl-RELEASE-0.16.0/Config.uk \
	/root/tenonos_works/tenon/lib/Config.uk \
	/root/tenonos_works/tenon/lib/vfscore/Config.uk \
	/root/tenonos_works/tenon/lib/ukvmem/Config.uk \
	/root/tenonos_works/tenon/lib/uktimeconv/Config.uk \
	/root/tenonos_works/tenon/lib/ukthread/Config.uk \
	/root/tenonos_works/tenon/lib/uktest/Config.uk \
	/root/tenonos_works/tenon/lib/ukswrand/Config.uk \
	/root/tenonos_works/tenon/lib/ukstreambuf/Config.uk \
	/root/tenonos_works/tenon/lib/ukstore/Config.uk \
	/root/tenonos_works/tenon/lib/uksp/Config.uk \
	/root/tenonos_works/tenon/lib/uksignal/Config.uk \
	/root/tenonos_works/tenon/lib/uksglist/Config.uk \
	/root/tenonos_works/tenon/lib/ukschedcoop/Config.uk \
	/root/tenonos_works/tenon/lib/uksched/Config.uk \
	/root/tenonos_works/tenon/lib/ukrust/Config.uk \
	/root/tenonos_works/tenon/lib/ukring/Config.uk \
	/root/tenonos_works/tenon/lib/ukreloc/Config.uk \
	/root/tenonos_works/tenon/lib/ukofw/Config.uk \
	/root/tenonos_works/tenon/lib/uknofault/Config.uk \
	/root/tenonos_works/tenon/lib/uknetdev/Config.uk \
	/root/tenonos_works/tenon/lib/ukmpi/Config.uk \
	/root/tenonos_works/tenon/lib/ukmmap/Config.uk \
	/root/tenonos_works/tenon/lib/uklock/Config.uk \
	/root/tenonos_works/tenon/lib/uklibparam/Config.uk \
	/root/tenonos_works/tenon/lib/uklibid/Config.uk \
	/root/tenonos_works/tenon/lib/ukintctlr/Config.uk \
	/root/tenonos_works/tenon/lib/ukgcov/Config.uk \
	/root/tenonos_works/tenon/lib/ukfile/Config.uk \
	/root/tenonos_works/tenon/lib/ukfallocbuddy/Config.uk \
	/root/tenonos_works/tenon/lib/ukfalloc/Config.uk \
	/root/tenonos_works/tenon/lib/ukdebug/Config.uk \
	/root/tenonos_works/tenon/lib/ukcpio/Config.uk \
	/root/tenonos_works/tenon/lib/ukbus/Config.uk \
	/root/tenonos_works/tenon/lib/ukboot/Config.uk \
	/root/tenonos_works/tenon/lib/ukblkdev/Config.uk \
	/root/tenonos_works/tenon/lib/ukbitops/Config.uk \
	/root/tenonos_works/tenon/lib/ukatomic/Config.uk \
	/root/tenonos_works/tenon/lib/ukargparse/Config.uk \
	/root/tenonos_works/tenon/lib/ukallocregion/Config.uk \
	/root/tenonos_works/tenon/lib/ukallocpool/Config.uk \
	/root/tenonos_works/tenon/lib/ukallocbbuddy/Config.uk \
	/root/tenonos_works/tenon/lib/ukalloc/Config.uk \
	/root/tenonos_works/tenon/lib/uk9p/Config.uk \
	/root/tenonos_works/tenon/lib/ubsan/Config.uk \
	/root/tenonos_works/tenon/lib/tntrace/Config.uk \
	/root/tenonos_works/tenon/lib/tntimer/Config.uk \
	/root/tenonos_works/tenon/lib/tnsystick/Config.uk \
	/root/tenonos_works/tenon/lib/tnschedprio/Config.uk \
	/root/tenonos_works/tenon/lib/tnpaging/Config.uk \
	/root/tenonos_works/tenon/lib/syscall_shim/Config.uk \
	/root/tenonos_works/tenon/lib/ramfs/Config.uk \
	/root/tenonos_works/tenon/lib/posix-user/Config.uk \
	/root/tenonos_works/tenon/lib/posix-unixsocket/Config.uk \
	/root/tenonos_works/tenon/lib/posix-timerfd/Config.uk \
	/root/tenonos_works/tenon/lib/posix-time/Config.uk \
	/root/tenonos_works/tenon/lib/posix-sysinfo/Config.uk \
	/root/tenonos_works/tenon/lib/posix-socket/Config.uk \
	/root/tenonos_works/tenon/lib/posix-process/Config.uk \
	/root/tenonos_works/tenon/lib/posix-poll/Config.uk \
	/root/tenonos_works/tenon/lib/posix-pipe/Config.uk \
	/root/tenonos_works/tenon/lib/posix-mmap/Config.uk \
	/root/tenonos_works/tenon/lib/posix-libdl/Config.uk \
	/root/tenonos_works/tenon/lib/posix-futex/Config.uk \
	/root/tenonos_works/tenon/lib/posix-fdtab/Config.uk \
	/root/tenonos_works/tenon/lib/posix-fdio/Config.uk \
	/root/tenonos_works/tenon/lib/posix-eventfd/Config.uk \
	/root/tenonos_works/tenon/lib/posix-environ/Config.uk \
	/root/tenonos_works/tenon/lib/nolibc/Config.uk \
	/root/tenonos_works/tenon/lib/isrlib/Config.uk \
	/root/tenonos_works/tenon/lib/fdt/Config.uk \
	/root/tenonos_works/tenon/lib/devfs/Config.uk \
	/root/tenonos_works/tenon/lib/9pfs/Config.uk \
	/root/tenonos_works/tenon-inference/build/kconfig/libs.uk \
	/root/tenonos_works/tenon/drivers/virtio/ring/Config.uk \
	/root/tenonos_works/tenon/drivers/virtio/pci/Config.uk \
	/root/tenonos_works/tenon/drivers/virtio/net/Config.uk \
	/root/tenonos_works/tenon/drivers/virtio/mmio/Config.uk \
	/root/tenonos_works/tenon/drivers/virtio/bus/Config.uk \
	/root/tenonos_works/tenon/drivers/virtio/blk/Config.uk \
	/root/tenonos_works/tenon/drivers/virtio/9p/Config.uk \
	/root/tenonos_works/tenon-inference/build/kconfig/drivers-virtio.uk \
	/root/tenonos_works/tenon/drivers/ukintctlr/xpic/Config.uk \
	/root/tenonos_works/tenon/drivers/ukintctlr/gic/Config.uk \
	/root/tenonos_works/tenon/drivers/ukintctlr/bcm_intc/Config.uk \
	/root/tenonos_works/tenon-inference/build/kconfig/drivers-intctlr.uk \
	/root/tenonos_works/tenon/drivers/ukbus/platform/Config.uk \
	/root/tenonos_works/tenon/drivers/ukbus/pci/Config.uk \
	/root/tenonos_works/tenon-inference/build/kconfig/drivers-bus.uk \
	/root/tenonos_works/tenon/drivers/Config.uk \
	/root/tenonos_works/tenon/drivers/virtio/Config.uk \
	/root/tenonos_works/tenon/drivers/uktty/ns8250/Config.uk \
	/root/tenonos_works/tenon/drivers/uktty/ns16550/Config.uk \
	/root/tenonos_works/tenon/drivers/uktty/pl011/Config.uk \
	/root/tenonos_works/tenon/drivers/uktty/Config.uk \
	/root/tenonos_works/tenon/drivers/tnsysclock/Config.uk \
	/root/tenonos_works/tenon-inference/build/kconfig/drivers.uk \
	/root/tenonos_works/tenon/plat/Config.uk \
	/root/tenonos_works/tenon/plat/kvm/Config.uk \
	/root/tenonos_works/tenon-inference/build/kconfig/plats.uk \
	/root/tenonos_works/tenon/arch/arm/arm64/Config.uk \
	/root/tenonos_works/tenon/arch/arm/arm/Config.uk \
	/root/tenonos_works/tenon/arch/x86/x86_64/Config.uk \
	/root/tenonos_works/tenon/arch/Config.uk \
	/root/tenonos_works/tenon/Config.uk

/root/tenonos_works/tenon-inference/build/kconfig/auto.conf: \
	$(deps_config)

ifneq "$(UK_FULLVERSION)" "0.16.0~1690661-custom"
/root/tenonos_works/tenon-inference/build/kconfig/auto.conf: FORCE
endif
ifneq "$(TN_FULLVERSION)" "0.1.0~1690661-custom"
/root/tenonos_works/tenon-inference/build/kconfig/auto.conf: FORCE
endif
ifneq "$(UK_CODENAME)" "Telesto"
/root/tenonos_works/tenon-inference/build/kconfig/auto.conf: FORCE
endif
ifneq "$(UK_ARCH)" "arm64"
/root/tenonos_works/tenon-inference/build/kconfig/auto.conf: FORCE
endif
ifneq "$(HOST_ARCH)" "x86_64"
/root/tenonos_works/tenon-inference/build/kconfig/auto.conf: FORCE
endif
ifneq "$(UK_BASE)" "/root/tenonos_works/tenon"
/root/tenonos_works/tenon-inference/build/kconfig/auto.conf: FORCE
endif
ifneq "$(UK_APP)" "/root/tenonos_works/tenon-inference"
/root/tenonos_works/tenon-inference/build/kconfig/auto.conf: FORCE
endif
ifneq "$(UK_NAME)" "tenon-inference"
/root/tenonos_works/tenon-inference/build/kconfig/auto.conf: FORCE
endif
ifneq "$(KCONFIG_DIR)" "/root/tenonos_works/tenon-inference/build/kconfig"
/root/tenonos_works/tenon-inference/build/kconfig/auto.conf: FORCE
endif
ifneq "$(KCONFIG_PLAT_BASE)" "/root/tenonos_works/tenon/plat"
/root/tenonos_works/tenon-inference/build/kconfig/auto.conf: FORCE
endif
ifneq "$(KCONFIG_EPLAT_DIRS)" ""
/root/tenonos_works/tenon-inference/build/kconfig/auto.conf: FORCE
endif
ifneq "$(KCONFIG_EXCLUDEDIRS)" ""
/root/tenonos_works/tenon-inference/build/kconfig/auto.conf: FORCE
endif
ifneq "$(KCONFIG_DRIV_BASE)" "/root/tenonos_works/tenon/drivers"
/root/tenonos_works/tenon-inference/build/kconfig/auto.conf: FORCE
endif
ifneq "$(KCONFIG_EDRIV_DIRS)" ""
/root/tenonos_works/tenon-inference/build/kconfig/auto.conf: FORCE
endif
ifneq "$(KCONFIG_LIB_BASE)" "/root/tenonos_works/tenon/lib"
/root/tenonos_works/tenon-inference/build/kconfig/auto.conf: FORCE
endif
ifneq "$(KCONFIG_ELIB_DIRS)" "/root/tenonos_works/libs/lib-musl-RELEASE-0.16.0 /root/tenonos_works/libs/lib-libcxxabi-RELEASE-0.16.0 /root/tenonos_works/libs/lib-libcxx-RELEASE-0.16.0 /root/tenonos_works/libs/lib-libunwind-RELEASE-0.16.0"
/root/tenonos_works/tenon-inference/build/kconfig/auto.conf: FORCE
endif
ifneq "$(KCONFIG_EAPP_DIR)" "/root/tenonos_works/tenon-inference"
/root/tenonos_works/tenon-inference/build/kconfig/auto.conf: FORCE
endif

$(deps_config): ;
