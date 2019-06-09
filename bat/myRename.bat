@echo off

SETLOCAL ENABLEDELAYEDEXPANSION

for /R %%s in (*.flac) do (
    set tempStr=%%s
    set oldStr=!tempStr:~8,100!
    set newStr=!tempStr:~19,100!

    rem echo !tempStr!
    rem echo !oldStr!
    rem echo !newStr!

    rename "!oldStr!" "!newStr!"
)

pause