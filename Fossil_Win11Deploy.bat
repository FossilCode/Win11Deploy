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
winget source update
winget install --id Fastfetch-cli.Fastfetch -e --silent
winget install --id Brave.Brave -e --silent
winget install --id Microsoft.PowerShell -e --silent
winget install --id Audacity.Audacity -e --silent
winget install --id Valve.Steam -e --silent
winget install --id dotPDN.PaintDotNet -e --silent
winget install --id Microsoft.VisualStudioCode -e --silent
winget install --id OpenJS.NodeJS -e --silent
winget install --id VideoLAN.VLC -e --silent
winget install --id Oracle.VirtualBox -e --silent
winget install --id REALiX.HWiNFO -e --silent
winget install --id Git.Git -e --silent
winget install --id Logitech.ghub -e --silent
winget install --id RiotGames.LeagueOfLegends.NA -e --silent
winget install --id Python.Python.3.13 -e --silent
winget install --id 7zip.7zip -e --silent
winget install --id Discord.Discord -e --silent
winget install --id qBittorrent.qBittorrent -e --silent
winget install --id Notepad++.Notepad++ -e --silent
winget install --id SpaceSniffer.SpaceSniffer -e --silent
winget install --id LibreOffice.LibreOffice -e --silent
winget install --id OBSProject.OBSStudio -e --silent
winget install --id AntoineAflalo.SoundSwitch -e --silent
winget install --id EpicGames.EpicGamesLauncher -e --silent
winget install --id ElectronicArts.EADesktop -e --silent
winget install --id ATLauncher.ATLauncher -e --silent