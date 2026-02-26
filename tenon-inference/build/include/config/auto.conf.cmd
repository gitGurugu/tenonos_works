deps_config := \
	/home/curryking/tenonos_work/tenon-inference/Config.uk \
	/home/curryking/tenonos_work/tenon-inference/build/kconfig/app.uk \
	/home/curryking/tenonos_work/tenon/lib/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/vfscore/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/ukvmem/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/uktimeconv/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/ukthread/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/uktest/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/ukswrand/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/ukstreambuf/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/ukstore/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/uksp/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/uksignal/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/uksglist/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/ukschedcoop/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/uksched/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/ukrust/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/ukring/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/ukreloc/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/ukofw/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/uknofault/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/uknetdev/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/ukmpi/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/ukmmap/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/uklock/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/uklibparam/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/uklibid/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/ukintctlr/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/ukgcov/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/ukfile/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/ukfallocbuddy/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/ukfalloc/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/ukdebug/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/ukcpio/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/ukbus/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/ukboot/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/ukblkdev/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/ukbitops/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/ukatomic/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/ukargparse/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/ukallocregion/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/ukallocpool/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/ukallocbbuddy/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/ukalloc/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/uk9p/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/ubsan/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/tntrace/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/tntimer/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/tnsystick/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/tnschedprio/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/tnpaging/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/syscall_shim/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/ramfs/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/posix-user/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/posix-unixsocket/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/posix-timerfd/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/posix-time/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/posix-sysinfo/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/posix-socket/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/posix-process/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/posix-poll/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/posix-pipe/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/posix-mmap/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/posix-libdl/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/posix-futex/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/posix-fdtab/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/posix-fdio/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/posix-eventfd/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/posix-environ/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/nolibc/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/isrlib/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/fdt/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/devfs/Config.uk \
	/home/curryking/tenonos_work/tenon/lib/9pfs/Config.uk \
	/home/curryking/tenonos_work/tenon-inference/build/kconfig/libs.uk \
	/home/curryking/tenonos_work/tenon/drivers/virtio/ring/Config.uk \
	/home/curryking/tenonos_work/tenon/drivers/virtio/pci/Config.uk \
	/home/curryking/tenonos_work/tenon/drivers/virtio/net/Config.uk \
	/home/curryking/tenonos_work/tenon/drivers/virtio/mmio/Config.uk \
	/home/curryking/tenonos_work/tenon/drivers/virtio/bus/Config.uk \
	/home/curryking/tenonos_work/tenon/drivers/virtio/blk/Config.uk \
	/home/curryking/tenonos_work/tenon/drivers/virtio/9p/Config.uk \
	/home/curryking/tenonos_work/tenon-inference/build/kconfig/drivers-virtio.uk \
	/home/curryking/tenonos_work/tenon/drivers/ukintctlr/xpic/Config.uk \
	/home/curryking/tenonos_work/tenon/drivers/ukintctlr/gic/Config.uk \
	/home/curryking/tenonos_work/tenon/drivers/ukintctlr/bcm_intc/Config.uk \
	/home/curryking/tenonos_work/tenon-inference/build/kconfig/drivers-intctlr.uk \
	/home/curryking/tenonos_work/tenon/drivers/ukbus/platform/Config.uk \
	/home/curryking/tenonos_work/tenon/drivers/ukbus/pci/Config.uk \
	/home/curryking/tenonos_work/tenon-inference/build/kconfig/drivers-bus.uk \
	/home/curryking/tenonos_work/tenon/drivers/Config.uk \
	/home/curryking/tenonos_work/tenon/drivers/virtio/Config.uk \
	/home/curryking/tenonos_work/tenon/drivers/uktty/ns8250/Config.uk \
	/home/curryking/tenonos_work/tenon/drivers/uktty/ns16550/Config.uk \
	/home/curryking/tenonos_work/tenon/drivers/uktty/pl011/Config.uk \
	/home/curryking/tenonos_work/tenon/drivers/uktty/Config.uk \
	/home/curryking/tenonos_work/tenon/drivers/tnsysclock/Config.uk \
	/home/curryking/tenonos_work/tenon-inference/build/kconfig/drivers.uk \
	/home/curryking/tenonos_work/tenon/plat/Config.uk \
	/home/curryking/tenonos_work/tenon/plat/kvm/Config.uk \
	/home/curryking/tenonos_work/tenon-inference/build/kconfig/plats.uk \
	/home/curryking/tenonos_work/tenon/arch/arm/arm64/Config.uk \
	/home/curryking/tenonos_work/tenon/arch/arm/arm/Config.uk \
	/home/curryking/tenonos_work/tenon/arch/x86/x86_64/Config.uk \
	/home/curryking/tenonos_work/tenon/arch/Config.uk \
	/home/curryking/tenonos_work/tenon/Config.uk

/home/curryking/tenonos_work/tenon-inference/build/kconfig/auto.conf: \
	$(deps_config)

ifneq "$(UK_FULLVERSION)" "0.16.0~d3facf8e-custom"
/home/curryking/tenonos_work/tenon-inference/build/kconfig/auto.conf: FORCE
endif
ifneq "$(TN_FULLVERSION)" "0.1.0~d3facf8e-custom"
/home/curryking/tenonos_work/tenon-inference/build/kconfig/auto.conf: FORCE
endif
ifneq "$(UK_CODENAME)" "Telesto"
/home/curryking/tenonos_work/tenon-inference/build/kconfig/auto.conf: FORCE
endif
ifneq "$(UK_ARCH)" "arm64"
/home/curryking/tenonos_work/tenon-inference/build/kconfig/auto.conf: FORCE
endif
ifneq "$(HOST_ARCH)" "x86_64"
/home/curryking/tenonos_work/tenon-inference/build/kconfig/auto.conf: FORCE
endif
ifneq "$(UK_BASE)" "/home/curryking/tenonos_work/tenon"
/home/curryking/tenonos_work/tenon-inference/build/kconfig/auto.conf: FORCE
endif
ifneq "$(UK_APP)" "/home/curryking/tenonos_work/tenon-inference"
/home/curryking/tenonos_work/tenon-inference/build/kconfig/auto.conf: FORCE
endif
ifneq "$(UK_NAME)" "tenon-inference"
/home/curryking/tenonos_work/tenon-inference/build/kconfig/auto.conf: FORCE
endif
ifneq "$(KCONFIG_DIR)" "/home/curryking/tenonos_work/tenon-inference/build/kconfig"
/home/curryking/tenonos_work/tenon-inference/build/kconfig/auto.conf: FORCE
endif
ifneq "$(KCONFIG_PLAT_BASE)" "/home/curryking/tenonos_work/tenon/plat"
/home/curryking/tenonos_work/tenon-inference/build/kconfig/auto.conf: FORCE
endif
ifneq "$(KCONFIG_EPLAT_DIRS)" ""
/home/curryking/tenonos_work/tenon-inference/build/kconfig/auto.conf: FORCE
endif
ifneq "$(KCONFIG_EXCLUDEDIRS)" ""
/home/curryking/tenonos_work/tenon-inference/build/kconfig/auto.conf: FORCE
endif
ifneq "$(KCONFIG_DRIV_BASE)" "/home/curryking/tenonos_work/tenon/drivers"
/home/curryking/tenonos_work/tenon-inference/build/kconfig/auto.conf: FORCE
endif
ifneq "$(KCONFIG_EDRIV_DIRS)" ""
/home/curryking/tenonos_work/tenon-inference/build/kconfig/auto.conf: FORCE
endif
ifneq "$(KCONFIG_LIB_BASE)" "/home/curryking/tenonos_work/tenon/lib"
/home/curryking/tenonos_work/tenon-inference/build/kconfig/auto.conf: FORCE
endif
ifneq "$(KCONFIG_ELIB_DIRS)" ""
/home/curryking/tenonos_work/tenon-inference/build/kconfig/auto.conf: FORCE
endif
ifneq "$(KCONFIG_EAPP_DIR)" "/home/curryking/tenonos_work/tenon-inference"
/home/curryking/tenonos_work/tenon-inference/build/kconfig/auto.conf: FORCE
endif

$(deps_config): ;
