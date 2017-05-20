@echo off

rm DLog.txt
rm audio.pcm

adb pull /sdcard/DLog.txt
adb pull /sdcard/audio.pcm

adb shell rm /sdcard/DLog.txt
adb shell rm /sdcard/audio.pcm
