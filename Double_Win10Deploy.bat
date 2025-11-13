@ECHO OFF
TITLE Windows Setup + Configuration Utility

::------------------------------------------------------------
::  ASCII Banner + Intro
::------------------------------------------------------------
ECHO     ____              __    __     ____                      
ECHO    / __ \____  __  __/ /_  / /__  / __ \__  ______  ________ 
ECHO   / / / / __ \/ / / / __ \/ / _ \/ / / / / / / __ \/ ___/ _ \
ECHO  / /_/ / /_/ / /_/ / /_/ / /  __/ /_/ / /_/ / / / / /__/  __/
ECHO /_____/\____/\__,_/_.___/_/\___/\____/\__,_/_/ /_/\___/\___/ 
ECHO.
ECHO --------------------------------------------------------------
ECHO          When one ounce just ain`t enough.
ECHO --------------------------------------------------------------
ECHO.
ECHO This utility automates post-install setup: adjusts system settings,
ECHO disables telemetry, and installs common apps via Winget.
ECHO.
ECHO Please make sure Windows is Up-To-Date and this is being run as admin.
ECHO.
PAUSE

::------------------------------------------------------------
::  Trigger Windows Update
::------------------------------------------------------------
ECHO Checking for Windows Updates...
powershell -Command "(New-Object -ComObject Microsoft.Update.AutoUpdate).DetectNow()" >nul 2>&1
ECHO Windows Update check triggered.
ECHO.

::------------------------------------------------------------
::  Registry Tweaks (Explorer, Privacy, Performance)
::------------------------------------------------------------
ECHO Applying system and privacy tweaks...

:: File Explorer
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Hidden /t REG_DWORD /d 1 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v LaunchTo /t REG_DWORD /d 1 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v ShowRecent /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v ShowFrequent /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v DisallowShaking /t REG_DWORD /d 1 /f >nul

:: Privacy / Telemetry
reg add "HKLM\Software\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v Enabled /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Privacy" /v TailoredExperiencesWithDiagnosticDataEnabled /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338388Enabled /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SystemPaneSuggestionsEnabled /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SilentInstalledAppsEnabled /t REG_DWORD /d 0 /f >nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortana /t REG_DWORD /d 0 /f

:: Performance
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Serialize" /v StartupDelayInMSec /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v GlobalUserDisabled /t REG_DWORD /d 1 /f >nul

:: UI / Taskbar / Theme
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v SearchboxTaskbarMode /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Policies\Microsoft\Windows\WindowsCopilot" /v TurnOffWindowsCopilot /t REG_DWORD /d 1 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v AppsUseLightTheme /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v SystemUsesLightTheme /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableTransparency /t REG_DWORD /d 0 /f >nul

:: Update Behavior
reg add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoRebootWithLoggedOnUsers /t REG_DWORD /d 1 /f >nul
reg add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v ExcludeWUDriversInQualityUpdate /t REG_DWORD /d 1 /f >nul

ECHO Tweaks applied successfully.
ECHO.

::------------------------------------------------------------
::  Winget Software Installation
::------------------------------------------------------------
ECHO Updating Winget sources...
winget source update

ECHO Installing applications...
FOR %%A IN (
    Fastfetch
    Brave
    PowerShell
    Audacity
    Valve.Steam
    dotPDN.PaintDotNet
    VisualStudioCode
    OpenJS.NodeJS
    VideoLAN.VLC
    REALiX.HWiNFO
    Logitech.GHUB
    RiotGames.LeagueOfLegends.NA
    Python.Python.3.13
    7zip
    Discord.Discord
    Notepad++
    SpaceSniffer
    EpicGamesLauncher
    EADesktop
) DO (
    ECHO Installing %%A...
    winget install %%A --accept-package-agreements --accept-source-agreements -h
)

::------------------------------------------------------------
::  Completion
::------------------------------------------------------------
ECHO.
ECHO --------------------------------------------------------------
ECHO      All tasks completed successfully! Enjoy your system.
ECHO --------------------------------------------------------------
ECHO.

PAUSE
