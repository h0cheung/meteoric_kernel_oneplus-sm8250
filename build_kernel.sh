#!/bin/bash

export ARCH=arm64
export CROSS_COMPILE="/HDD/android_kernel_build_tools/gcc-12/bin/aarch64-linux-gnu-"
export PATH="/HDD/android_kernel_build_tools/clang/bin:$PATH"

make clean -j8 && make mrproper -j8

make O=out HOSTCC="ccache clang" CC="ccache clang" HOSTCXX="ccache clang++" HOSTLD="ccache ld.lld" LD="ccache ld.lld" HOSTAR="ccache llvm-ar" AR="ccache llvm-ar" NM="ccache llvm-nm" OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump READELF=llvm-readelf OBJSIZE=llvm-size STRIP="ccache llvm-strip" vendor/kona-perf_defconfig -j8

make O=out HOSTCC="ccache clang" CC="ccache clang" HOSTCXX="ccache clang++" HOSTLD="ccache ld.lld" LD="ccache ld.lld" HOSTAR="ccache llvm-ar" AR="ccache llvm-ar" NM="ccache llvm-nm" OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump READELF=llvm-readelf OBJSIZE=llvm-size STRIP="ccache llvm-strip" -j8

