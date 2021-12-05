#!/bin/bash

export ARCH=arm64
export CROSS_COMPILE="/home/fra/gcc-12/bin/aarch64-linux-gnu-"

make clean -j69 && make mrproper -j69

PATH="/home/fra/clang/bin:${PATH}" \
	make O=out HOSTCC="ccache clang" CC="ccache clang" HOSTCXX="ccache clang++" HOSTLD="ccache ld.lld" LD="ccache ld.lld" HOSTAR="ccache llvm-ar" AR="ccache llvm-ar" NM="ccache llvm-nm" STRIP="ccache llvm-strip" vendor/kona-perf_defconfig -j69

PATH="/home/fra/clang/bin:${PATH}" \
	make O=out HOSTCC="ccache clang" CC="ccache clang" HOSTCXX="ccache clang++" HOSTLD="ccache ld.lld" LD="ccache ld.lld" HOSTAR="ccache llvm-ar" AR="ccache llvm-ar" NM="ccache llvm-nm" STRIP="ccache llvm-strip" -j69

