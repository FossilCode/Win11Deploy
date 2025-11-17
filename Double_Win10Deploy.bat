@ECHO OFF
TITLE Windows Setup + Configuration Utility

:: Ensure we're running elevated
NET SESSION >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    ECHO This script must be run as Administrator.
    ECHO Right-click the batch file and choose "Run as administrator".
    PAUSE
    EXIT /B 1
)
ECHO.
ECHO     ____              __    __     ____                      
ECHO    / __ \____  __  __/ /_  / /__  / __ \__  ______  ________ 
ECHO   / / / / __ \/ / / / __ \/ / _ \/ / / / / / / __ \/ ___/ _ \
ECHO  / /_/ / /_/ / /_/ / /_/ / /  __/ /_/ / /_/ / / / / /__/  __/
ECHO /_____/\____/\__,_/_.___/_/\___/\____/\__,_/_/ /_/\___/\___/ 
ECHO.
ECHO This utility automates post-install setup: adjusts system settings,
ECHO disables telemetry, and installs common apps via Winget.
ECHO.
ECHO Please make sure Windows is Up-To-Date and this is being run as admin.
ECHO.
PAUSE

:: ============================================================
:: Windows Update Check
:: ============================================================
ECHO Checking for Windows Updates...
powershell -Command "(New-Object -ComObject Microsoft.Update.AutoUpdate).DetectNow()" >nul 2>&1
ECHO Windows Update check triggered.
ECHO.

:: ============================================================
:: Registry Tweaks
:: ============================================================
ECHO Applying system and privacy tweaks...

:: File Explorer
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Hidden /t REG_DWORD /d 1 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v LaunchTo /t REG_DWORD /d 1 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v ShowRecent /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v ShowFrequent /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v DisallowShaking /t REG_DWORD /d 1 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Serialize" /v StartupDelayInMSec /t REG_DWORD /d 0 /f >nul

:: Privacy & Telemetry
reg add "HKLM\Software\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v Enabled /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Privacy" /v TailoredExperiencesWithDiagnosticDataEnabled /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338388Enabled /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SystemPaneSuggestionsEnabled /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SilentInstalledAppsEnabled /t REG_DWORD /d 0 /f >nul

:: Search & Cortana
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortana /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v SearchboxTaskbarMode /t REG_DWORD /d 0 /f >nul

:: UI & Theme
reg add "HKCU\Software\Policies\Microsoft\Windows\WindowsCopilot" /v TurnOffWindowsCopilot /t REG_DWORD /d 1 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v AppsUseLightTheme /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v SystemUsesLightTheme /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableTransparency /t REG_DWORD /d 0 /f >nul

:: Performance
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v GlobalUserDisabled /t REG_DWORD /d 1 /f >nul

:: Windows Update Behavior
reg add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoRebootWithLoggedOnUsers /t REG_DWORD /d 1 /f >nul
reg add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v ExcludeWUDriversInQualityUpdate /t REG_DWORD /d 1 /f >nul

ECHO Registry tweaks applied.
ECHO.

:: ============================================================
:: OneDrive Removal
:: ============================================================
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
ECHO OneDrive disabled and removed.
ECHO.

:: ============================================================
:: Software Installation (Winget)
:: ============================================================
ECHO Updating Winget sources...
winget source update

ECHO Installing applications...
FOR %%A IN (
    Fastfetch
    Brave
    PowerShell
    Audacity
    Valve.Steam
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
    Parsec.Parsec
) DO (
    ECHO Installing %%A...
    winget install %%A --accept-package-agreements --accept-source-agreements --scope machine -h
)
ECHO.

:: ============================================================
:: Completion
:: ============================================================
ECHO All tasks completed successfully!
ECHO.
PAUSE
