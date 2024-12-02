@ECHO OFF

ECHO Make sure Windows is UP-TO-DATE and this is being run as ADMIN.
ECHO Program will automatically close when finished --- ~35 seconds.
PAUSE
ECHO Setting Fossil's custom windows settings and installing beloved programs...



REM Registry tweaks
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /t REG_DWORD /d 2 /f >nul
reg add "HKCU\Control Panel\Desktop" /v DragFullWindows /t REG_SZ /d 1 /f >nul

REM Install software using winget
winget install Fastfetch-cli.Fastfetch --silent
winget install Brave.Brave --silent
winget install Microsoft.PowerShell --silent
winget install Audacity.Audacity --silent
winget install Valve.Steam --silent
winget install dotPDN.PaintDotNet --silent
winget install StartIsBack.StartAllBack --silent
winget install Microsoft.PowerToys --silent
winget install Microsoft.VisualStudioCode --silent
winget install OpenJS.NodeJS --silent
winget install VideoLAN.VLC --silent
winget install Oracle.VirtualBox --silent
winget install REALiX.HWiNFO --silent
winget install Git.Git --silent
winget install wget --silent

wget https://github.com/crazy-max/WindowsSpyBlocker/releases/download/4.39.0/WindowsSpyBlocker.exe -O WindowsSpyBlocker.exe


IF EXIST WindowsSpyBlocker.exe (
    ECHO Running WindowsSpyBlocker...

    REM Use timeout to delay input, then pipe the responses to the exe
    timeout /t 1 >nul

    (
        echo 1
        timeout /t 1 >nul
        echo 1
        timeout /t 1 >nul
        echo 1
        timeout /t 25 >nul
        echo exit

    ) | WindowsSpyBlocker.exe

) ELSE (
    ECHO Failed to download WindowsSpyBlocker.exe
)

echo exit
echo Cleaning up...
rm libs
rm logs
rm tmp
rm app.conf