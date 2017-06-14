#!/bin/bash  
#这里修改为你的ndk的路径
NDK=/home/double/share/android-ndk-r14b
#注意android-9文件夹的版本号，替换好自己的版本号。下面的路径同理 
SYSROOT=$NDK/platforms/android-9/arch-arm/
TOOLCHAIN=$NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64
function build_one(){
 ./configure \
--prefix=$PREFIX \
--enable-shared \
--disable-static \
--disable-doc \
--disable-ffserver \
--disable-ffmpeg \
--disable-ffplay \
--disable-ffprobe \
--disable-everything \
--enable-decoder=eac3 \
--enable-decoder=swresample \
--enable-cross-compile \
--cross-prefix=$TOOLCHAIN/bin/arm-linux-androideabi- \
--target-os=linux \
--arch=arm \
--sysroot=$SYSROOT \
--extra-cflags="-Os -fpic $ADDI_CFLAGS" \
--extra-ldflags="$ADDI_LDFLAGS" \
$ADDITIONAL_CONFIGURE_FLAG
}
CPU=arm  
PREFIX=$(pwd)/android/$CPU
ADDI_CFLAGS="-marm"
build_one
