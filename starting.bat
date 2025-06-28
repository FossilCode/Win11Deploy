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
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v BingSearchEnabled /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v CortanaConsent /t REG_DWORD /d 0 /f >nul
reg delete "HKEY_CURRENT_USER\Software\Microsoft\OneDrive" /f >nul

REM Install software using winget
winget install Fastfetch --silent
winget install Brave --silent
winget install PowerShell --silent
winget install Audacity --silent
winget install Valve.Steam --silent
winget install dotPDN.PaintDotNet --silent
winget install PowerToys --silent
winget install VisualStudioCode --silent
winget install OpenJS.NodeJS --silent
winget install VideoLAN.VLC --silent
winget install Oracle.VirtualBox --silent
winget install REALiX.HWiNFO --silent
winget install Git.Git --silent
winget install Logitech.GHUB --silent
winget install RiotGames.LeagueOfLegends.NA --silent
winget install Python.Python.3.13 --silent
winget install 7zip --silent
winget install Discord --silent
winget install qBittorrent --silent
winget install RamenSoftware.Windhawk --silent 
winget install Notepad++ --silent
winget install SpaceSniffer --silent
winget install LibreOffice --silent
winget install CCleaner --silent
winget install OBSProject.OBSStudio --silent
winget install AntoineAflalo.SoundSwitch --silent
winget install EpicGamesLauncher --silent
winget install EADesktop --silent
winget install ATLauncher --silent
