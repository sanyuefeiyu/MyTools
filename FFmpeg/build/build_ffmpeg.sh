#!/bin/bash  
#这里修改为你的ndk的路径
NDK=/home/double/share/android-ndk-r14b
#注意android-9文件夹的版本号，替换好自己的版本号。下面的路径同理 
SYSROOT=$NDK/platforms/android-9/arch-arm/
TOOLCHAIN=$NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64

export PATH=$TOOLCHAIN/bin:$PATH
export CC="ccache arm-linux-androideabi-gcc"

rm libavutil/log2_tab.o
rm libavformat/log2_tab.o
rm libswresample/log2_tab.o
rm libavutil/reverse.o
rm libavformat/golomb_tab.o

$CC -lm -lz -shared --sysroot=$SYSROOT -Wl,--no-undefined -Wl,-z,noexecstack libavutil/*.o libavutil/arm/*.o libavcodec/*.o libavcodec/arm/*.o libavformat/*.o libswresample/*.o libswresample/arm/*.o compat/*.o -o ./libffmpeg_ddp.so

cp ./libffmpeg_ddp.so ./libffmpeg_ddp_debug.so
arm-linux-androideabi-strip --strip-unneeded ./libffmpeg_ddp.so
mv ./libffmpeg_ddp.so ./android/arm/
mv ./libffmpeg_ddp_debug.so ./android/arm/
