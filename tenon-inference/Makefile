UK_ROOT ?= $(PWD)/workdir/unikraft
UK_LIBS ?= $(PWD)/workdir/libs
UK_BUILD ?= $(PWD)/workdir/build
LIBS :=

# 设置 TenonOS 核心目录 (根据实际路径修改)
# 注意：这里必须指到真正的 TenonOS 内核工程目录
TENONOS_DIR ?= /root/tenonos_works/tenon

# 默认目标
.PHONY: all
all:
	@$(MAKE) -C $(TENONOS_DIR) A=$(PWD) L=$(LIBS) O=$(UK_BUILD)

# 配置菜单
.PHONY: menuconfig
menuconfig:
	@$(MAKE) -C $(TENONOS_DIR) A=$(PWD) menuconfig

# 使用默认配置
.PHONY: defconfig
defconfig:
	@$(MAKE) -C $(TENONOS_DIR) A=$(PWD) defconfig

# 编译
.PHONY: build
build:
	@$(MAKE) -C $(TENONOS_DIR) A=$(PWD) L=$(LIBS) O=$(UK_BUILD)

# 清理
.PHONY: clean
clean:
	@$(MAKE) -C $(TENONOS_DIR) A=$(PWD) L=$(LIBS) O=$(UK_BUILD) clean

# 运行 (需要配置好 QEMU)
.PHONY: run
run:
	@$(MAKE) -C $(TENONOS_DIR) A=$(PWD) L=$(LIBS) O=$(UK_BUILD) run

# 调试
.PHONY: gdb
gdb:
	@$(MAKE) -C $(TENONOS_DIR) A=$(PWD) L=$(LIBS) O=$(UK_BUILD) gdb

# 传递其他目标
$(MAKECMDGOALS):
	@$(MAKE) -C $(TENONOS_DIR) A=$(PWD) L=$(LIBS) O=$(UK_BUILD) $(MAKECMDGOALS)

