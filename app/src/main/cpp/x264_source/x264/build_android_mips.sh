#!/bin/bash
NDK=/home/android-ndk-r14b
PLATFORM=$NDK/platforms/android-18/arch-mips/
TOOLCHAIN=$NDK/toolchains/mipsel-linux-android-4.9/prebuilt/linux-x86_64
PREFIX=./libs/mips

function build_one
{
  ./configure \
  --prefix=$PREFIX \
  --enable-static \
  --enable-pic \
  --host=mipsel-linux \
  --cross-prefix=$TOOLCHAIN/bin/mipsel-linux-android- \
  --sysroot=$PLATFORM \
  --disable-asm

  make clean
  make
  make install
}

build_one

echo Android MIPS builds finished
