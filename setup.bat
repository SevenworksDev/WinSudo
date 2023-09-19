@echo off

>nul 2>&1 net session || (
    echo Please run this script with administrator privileges.
    pause
    exit /b
)

echo Installing sudo

set url=https://github.com/SevenworksDev/WinSudo/releases/download/sudo-v3/sudo.exe
set file=sudo.exe
certutil -urlcache -split -f %url% %file%
:also certutil.exe -verifyctl -f -split %url% %file%
move sudo.exe C:\Windows\sudo.exe
start C:\Windows\sudo.exe
