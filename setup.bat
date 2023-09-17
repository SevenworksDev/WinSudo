@echo off

>nul 2>&1 net session || (
    echo Please run this script with administrator privileges.
    pause
    exit /b
)

set "urls[0]=https://github.com/SevenworksDev/WinSudo/releases/download/sudo-v1/sudo.exe"
set "destinations[0]=C:\Windows\sudo.exe"

echo Installing sudo

for /l %%i in (0,1,1) do (
    set "url=!urls[%%i]!"
    set "destination=!destinations[%%i]!"
    curl -o "!destination!" "!url!" > nul 2>&1
    if not exist "!destination!" (
        echo Failed to download sudo.
    ) else (
        echo sudo downloaded successfully, setting up.
    )
)

start C:\Windows\sudo.exe
