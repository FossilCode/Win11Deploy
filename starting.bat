@ECHO OFF
ECHO     ______ ____  _____ _____  ____ __ 
ECHO    / ____// __ \/ ___// ___/ /  _// / 
ECHO   / /_   / / / /\__ \ \__ \  / / / /  
ECHO  / __/  / /_/ /___/ /___/ /_/ / / /___
ECHO /_/     \____//____//____//___//_____/
                                      
ECHO Ensure that Windows is up to date.
ECHO Applying custom Windows settings and installing beloved programs...
timeout /t 10
REM Registry tweaks
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /t REG_DWORD /d 2 /f >nul
reg add "HKCU\Control Panel\Desktop" /v DragFullWindows /t REG_SZ /d 1 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v BingSearchEnabled /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v CortanaConsent /t REG_DWORD /d 0 /f >nul
reg delete "HKEY_CURRENT_USER\Software\Microsoft\OneDrive" /f >nul

REM Install software using winget
winget install Fastfetch-cli.Fastfetch --silent
winget install Brave.Brave --silent
winget install Microsoft.PowerShell --silent
winget install Audacity.Audacity --silent
winget install Valve.Steam --silent
winget install dotPDN.PaintDotNet --silent
winget install Microsoft.PowerToys --silent
winget install Microsoft.VisualStudioCode --silent
winget install OpenJS.NodeJS --silent
winget install VideoLAN.VLC --silent
winget install Oracle.VirtualBox --silent
winget install REALiX.HWiNFO --silent
winget install Git.Git --silent
winget install FortyOneLtd.AudioSwitcher --silent
winget install Logitech.GHUB --silent
winget install RiotGames.LeagueOfLegends.NA --silent
winget install Python.Python.3.13 --silent
winget install 7zip.7zip --silent
winget install Discord.Discord --silent
winget install qBittorrent.qBittorrent --silent
