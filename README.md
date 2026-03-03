### TenonOS Inference Framework 说明文档

---

### 1. 项目概述

TenonOS Inference Framework 是构建在 **TenonOS（基于 Unikraft 的 unikernel）** 之上的一个推理框架 demo，目标是：

- **统一推理入口**：在 TenonOS 中跑起来的推理应用（后端可为 MNN 等）。
- **最小 TCB**：全静态链接、没有动态插件，尽量减小运行时依赖和镜像体积。
- **多场景适配**：既能在本机 QEMU 环境跑，也能迁移到 ARM64 开发板上。

当前仓库结构（与本项目相关部分）大致为：

- `tenon/`：TenonOS（Unikraft 内核工程）
- `tenon-inference/`：推理应用工程（本仓库主要内容）
- `MNN/`：MNN 源码
- `libs/`：通用静态库等
- `model/`、`Qwen2.5-0.5B-Instruct/`：示例模型（如 Qwen2.5-0.5B）
- `app-helloworld/`：简单 HelloWorld 应用示例

---

### 2. 环境依赖

- Linux x86_64（当前为 Ubuntu / 5.15 内核）
- 交叉工具链：`aarch64-linux-gnu-gcc` / `aarch64-linux-gnu-g++`
- QEMU / KVM（用于在 x86_64 上跑 aarch64 guest）
- TenonOS 源码路径：`/root/tenonos_works/tenon`（在 `tenon-inference/Makefile` 中通过 `TENONOS_DIR` 指定）
- MNN ARM64 版本静态库和头文件（位于 `tenon-inference/3rdparty/` 或上层 `MNN/`）

---

### 3. 编译与运行

在宿主机上进入工程目录：

```bash
cd /root/tenonos_works/tenon
```

#### 3.1 生成默认配置

```bash
make defconfig
```

该步骤会生成默认的 TenonOS + 应用配置，其中包含若干 `APPINFERENCE_*` 相关的选项。

#### 3.2 配置应用（可选）

```bash
make menuconfig \
  A=/root/tenonos_works/tenon-inference \
  L=/root/tenonos_works/libs
```

在 menuconfig 中可以调整例如：

- 线程数量、请求队列大小
- 是否启用 batch、batch 大小和超时
- 日志等级、是否开启 metrics / trace
- 模型路径、模型内存限制等

#### 3.3 编译镜像

```bash
make -j"$(nproc)" CROSS_COMPILE=aarch64-linux-gnu-   A=/root/tenonos_works/tenon-inference   L=/root/tenonos_works/libs 2> error.log

```

这一步会调用 `TENONOS_DIR` 指向的 TenonOS 工程完成 unikernel 构建，最终生成可供 QEMU 启动的镜像。

#### 3.4 运行与调试

```bash
# 启动 unikernel（通过 QEMU）
sudo qemu-system-aarch64 \
  -machine virt -cpu cortex-a53 -m 4G -nographic \
  -kernel tenon-inference_qemu-arm64.dbg \
  -fsdev local,id=fsdev0,path=/root/tenonos_works,security_model=none \
  -device virtio-9p-device,fsdev=fsdev0,mount_tag=fs0 \
  -nic none \
  -append "console=ttyAMA0 /model/llm.mnn qwen2.5-0.5b 1 4096" \
  -S -s

# 使用 GDB 进行调试
gdb-multiarch tenon-inference_qemu-arm64.dbg
```

当前应用入口是一个最小的 C/C++ demo（HelloWorld），主要用于验证：

- TenonOS 环境下 C/C++ 运行时是否工作正常
- 日志 / 标准输出是否打通
- 静态链接的库（如 MNN、libstdc++）是否能够被正确加载

---

### 4. 关键配置项（概览）

在 `tenon-inference/Config.uk` 中，提供了一些可通过 `menuconfig` 调整的选项（名称可能略有差异，这里列的是设计意图）：

- **并发和批处理**
  - **`APPINFERENCE_THREAD_COUNT`**：worker 线程数
  - **`APPINFERENCE_QUEUE_SIZE`**：请求队列长度
  - **`APPINFERENCE_BATCH_ENABLED`**：是否开启 batch
  - **`APPINFERENCE_BATCH_MAX_SIZE`**：单批最大请求数
  - **`APPINFERENCE_BATCH_TIMEOUT_US`**：batch 等待超时（微秒）

- **调度**
  - **`APPINFERENCE_ENABLE_PREEMPTIVE`**：是否使用抢占式调度（内部依赖 `LIBTNSCHEDPRIO`）

- **快照与冷启动**
  - **`APPINFERENCE_SNAPSHOT`**：是否启用 snapshot 减少首包延迟
  - **`APPINFERENCE_SNAPSHOT_PATH`**：snapshot 文件路径

- **可观测性**
  - **`APPINFERENCE_METRICS`**：开启简单指标（QPS、延迟等）
  - **`APPINFERENCE_TRACE`**：开启轻量 trace
  - **`APPINFERENCE_LOG_LEVEL`**：日志等级（0–3）

- **模型与内存限制**
  - **`APPINFERENCE_MODEL_PATH`**：模型根目录（如 `/models`）
  - **`APPINFERENCE_MAX_MODEL_SIZE`**：单模型最大 size
  - **`APPINFERENCE_ENABLE_MULTI_MODEL`**：是否支持多模型共驻
  - **`APPINFERENCE_MODEL_MEM_LIMIT`**：所有模型总内存上限

---

### 5. 统一推理 API（设计思路）

后续的完整版本预期对外暴露统一的 C/C++ 接口，例如：

- **模型加载：**

```c
int tenon_load_model(const char *path, tenon_model_handle_t *handle);
```

- **推理执行：**

```c
int tenon_infer(tenon_model_handle_t handle,
                const tenon_request_t *req,
                tenon_response_t *resp);
```

- **模型卸载：**

```c
int tenon_unload_model(tenon_model_handle_t handle);
```

内部由线程池、调度模块、内存池和 MNN 封装模块协同完成实际推理逻辑，用户只需关心统一的 load / infer / unload 接口。

目前仓库中与这些接口相关的 `src/*.cpp` 代码处于精简/重构中，构建阶段以 HelloWorld 为主，方便先验证工具链与运行环境。

---

### 6. 后续扩展方向（简要）

- 将 `Qwen2.5-0.5B-Instruct` 等小模型集成进 TenonOS Inference，完成端到端推理。
- 在 ARM64（如 RK3568 / 树莓派）上实际验证延迟、吞吐和内存占用。
- 完善 metrics / tracing / logging，使其在保持 ≤5% 性能开销的前提下提供足够可观测性。
- 针对不同场景（在线问答、批量推理等）调优线程数、批处理策略和优先级调度策略。

