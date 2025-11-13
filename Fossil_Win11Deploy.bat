@ECHO OFF
ECHO.
ECHO     ______ ____  _____ _____  ____ __ 
ECHO    / ____// __ \/ ___// ___/ /  _// / 
ECHO   / /_   / / / /\__ \ \__ \  / / / /  
ECHO  / __/  / /_/ /___/ /___/ /_/ / / /___
ECHO /_/     \____//____//____//___//_____/
ECHO.                                      
ECHO.
ECHO This utility automates post-install setup: adjusts system settings,
ECHO disables telemetry, and installs common apps via Winget.
ECHO.
ECHO Please make sure Windows is Up-To-Date and this is being run as admin.
ECHO.
PAUSE

::------------------------------------------------------------
::  Registry Tweaks (Explorer, Privacy, Performance, UI, OneDrive)
::------------------------------------------------------------
ECHO Applying system and privacy tweaks...

:: ---------- File Explorer ----------
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Hidden /t REG_DWORD /d 1 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v LaunchTo /t REG_DWORD /d 1 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v ShowRecent /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v ShowFrequent /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v DisallowShaking /t REG_DWORD /d 1 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Serialize" /v StartupDelayInMSec /t REG_DWORD /d 0 /f >nul

:: ---------- Privacy / Telemetry ----------
reg add "HKLM\Software\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v Enabled /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Privacy" /v TailoredExperiencesWithDiagnosticDataEnabled /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338388Enabled /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SystemPaneSuggestionsEnabled /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SilentInstalledAppsEnabled /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SoftLandingEnabled /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v RotatingLockScreenEnabled /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v OemPreInstalledAppsEnabled /t REG_DWORD /d 0 /f >nul

:: ---------- Cortana / Search ----------
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortana /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v BingSearchEnabled /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v CortanaConsent /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v SearchboxTaskbarMode /t REG_DWORD /d 0 /f >nul

:: ---------- OneDrive Removal ----------
ECHO Disabling and removing OneDrive...
taskkill /f /im OneDrive.exe >nul 2>&1
if exist "%SystemRoot%\System32\OneDriveSetup.exe" ("%SystemRoot%\System32\OneDriveSetup.exe" /uninstall)
if exist "%SystemRoot%\SysWOW64\OneDriveSetup.exe" ("%SystemRoot%\SysWOW64\OneDriveSetup.exe" /uninstall)
reg add "HKLM\Software\Policies\Microsoft\Windows\OneDrive" /v DisableFileSyncNGSC /t REG_DWORD /d 1 /f >nul
reg add "HKLM\Software\Policies\Microsoft\Windows\OneDrive" /v DisableFileSync /t REG_DWORD /d 1 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v OneDrive /t REG_SZ /d "" /f >nul
rd "%UserProfile%\OneDrive" /Q /S >nul 2>&1
rd "%LocalAppData%\Microsoft\OneDrive" /Q /S >nul 2>&1
rd "%ProgramData%\Microsoft OneDrive" /Q /S >nul 2>&1
reg add "HKCR\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /v System.IsPinnedToNameSpaceTree /t REG_DWORD /d 0 /f >nul
reg add "HKCR\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /v System.IsPinnedToNameSpaceTree /t REG_DWORD /d 0 /f >nul
ECHO OneDrive has been disabled and uninstalled.

:: ---------- Performance / Background Apps ----------
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v GlobalUserDisabled /t REG_DWORD /d 1 /f >nul

:: ---------- UI / Taskbar / Theme ----------
reg add "HKCU\Software\Policies\Microsoft\Windows\WindowsCopilot" /v TurnOffWindowsCopilot /t REG_DWORD /d 1 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v AppsUseLightTheme /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v SystemUsesLightTheme /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableTransparency /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t REG_SZ /d 0 /f >nul
reg add "HKCU\Control Panel\Desktop" /v MenuShowDelay /t REG_SZ /d 0 /f >nul

:: ---------- Lock Screen ----------
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Personalization" /v NoLockScreen /t REG_DWORD /d 1 /f >nul

:: ---------- Error Reporting / Feedback ----------
reg add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v Disabled /t REG_DWORD /d 1 /f >nul
reg add "HKCU\Software\Microsoft\Siuf\Rules" /v "NumberOfSIUFInPeriod" /t REG_DWORD /d 0 /f >nul

:: ---------- Update Behavior ----------
reg add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoRebootWithLoggedOnUsers /t REG_DWORD /d 1 /f >nul
reg add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v ExcludeWUDriversInQualityUpdate /t REG_DWORD /d 1 /f >nul

ECHO All registry tweaks applied successfully.
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
    Python.Python.3.14
    7zip
    Discord.Discord
    Notepad++
    SpaceSniffer
    EpicGamesLauncher
    EADesktop
    ATLauncher
    qBittorrent.qBittorrent
    AntoineAflalo.SoundSwitch
) DO (
    ECHO Installing %%A...
    winget install %%A --accept-package-agreements --accept-source-agreements --scope machine -h
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

