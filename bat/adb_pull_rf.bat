@echo off

rm -rf DLog.txt
rm -rf audio.pcm

adb pull /sdcard/DLog.txt
adb pull /sdcard/audio.pcm

adb shell rm -rf /sdcard/DLog.txt
adb shell rm -rf /sdcard/audio.pcm
