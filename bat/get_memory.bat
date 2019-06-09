@echo off
echo start to test memory...

echo %date% %time%

set T=%date:~0,4%.%date:~5,2%.%date:~8,2%_%time:~0,2%.%time:~3,2%.%time:~6,2%

echo %T%

:start

adb shell dumpsys meminfo com.huawei.PEPlayerTest >> %T%.txt

ping 127.0.0.1 > nul 

goto start
