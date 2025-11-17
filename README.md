# Windows Post-Install Setup Utility

Automated setup scripts for Windows 10 and Windows 11.  
Applies system tweaks, disables telemetry, removes OneDrive, and installs apps via Winget.

---

## Scripts

- **`Double_Win10Deploy.bat`** – Windows 10 setup
- **`Fossil_Win11Deploy.bat`** – Windows 11 setup

Both follow the same safe execution order and structure.

---

## What It Does

**1. Windows Update Check**  
Triggers Windows Update to ensure system is current before proceeding.

**2. Registry Tweaks**  
- File Explorer: Show hidden files, remove recent/frequent items
- Privacy & Telemetry: Disable data collection and ads
- Search & Cortana: Disable Cortana, Bing search, taskbar search
- UI & Theme: Dark theme, disable Copilot, remove animations
- Performance: Disable background apps
- Windows Update: Prevent auto-restart, exclude driver updates
- *Win11 only: Disable lock screen and error reporting*

**3. OneDrive Removal**  
Kill process, uninstall, remove folders and registry entries, unpin from Explorer.

**4. Software Installation**  
Installs apps via Winget (Brave, VS Code, Python, Steam, Discord, etc.)  
*Win11 includes: Paint.NET, ATLauncher, qBittorrent, SoundSwitch*

---

## Requirements

- Windows 10 (22H2+) or Windows 11
- Administrator privileges
- Winget (included in modern Windows versions)

---

## How to Run

1. Right-click the `.bat` file → **Run as administrator**
2. Wait for completion (takes 10–20 minutes depending on internet speed)

**Note:** Script will pause if it encounters an error. Check the console for details.

---

## Safety

- Registry changes are safe and reversible
- All changes are user-scoped (HKCU) except OneDrive and Policies
- OneDrive removal is the most invasive step; back up data first if needed
- Script runs in admin mode and requires confirmation to start
