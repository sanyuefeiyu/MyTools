@echo off
echo.

echo current time is [%time%]
set File_Name="%date:~0,4%%date:~5,2%%date:~8,2%_%time:~0,2%%time:~3,2%"
echo.

adb shell logcat -c
adb shell logcat -v time > log_%File_Name%.txt

pause