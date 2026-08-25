# 编译安装

本文档说明如何从源码编译 libxnes 库及示例程序。

## 依赖

libxnes 库本身仅依赖标准 C 库。编译 Linux 示例程序需要安装 SDL2：

```shell
sudo apt-get install libsdl2-dev
```

macOS 使用 Homebrew 安装 SDL2：

```shell
brew install sdl2
```

## 编译

在源码根目录执行：

```shell
cd libxnes
make
```

编译完成后将生成：

- `examples/linux/output/xnes` — Linux SDL2 示例程序
- `examples/mac/output/xnes` — macOS SDL2 示例程序（Apple Silicon 或 Intel）
- `examples/windows/output/xnes.exe` — Windows 示例程序（交叉编译）
- `examples/debugger/output/xnes-debugger` — 调试器示例

## 仅编译 Linux 示例

```shell
make -C examples/linux
```

## 编译 macOS 示例

在 macOS 上，根目录的 `make` 会自动构建 macOS 示例，也可以单独执行：

```shell
make -C examples/mac
```

## 运行

```shell
cd examples/linux/output/
./xnes <rom.nes>
```

macOS 示例位于 `examples/mac/output/xnes`，支持相同的键盘、手柄和拖拽加载操作。

也可以直接将 `.nes` 文件拖拽到程序窗口上加载。

## 交叉编译 Windows 版本

Windows 示例使用 MinGW 交叉编译，仓库已包含 SDL2 的 Windows 开发库：

```shell
make -C examples/windows
```

## 集成到项目

libxnes 使用 `xnes.mk` Makefile 片段，方便集成到其他项目中。在你的 Makefile 中引入：

```makefile
sinclude <path-to-libxnes>/src/xnes.mk
```

这会自动添加 libxnes 的头文件路径和源文件目录。然后在代码中包含头文件：

```c
#include <xnes.h>
```

## 清理

```shell
make clean
```
