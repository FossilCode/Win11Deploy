# 🪟 Windows Post-Install Setup & Configuration Utility

A **Windows 10/11 automation script** that streamlines your post-install setup.  
It applies useful **system tweaks**, **disables telemetry**, **removes OneDrive**, and **installs essential software** using **Winget** — all in one go.

---

## ⚙️ Features

### 🧩 System Tweaks
- Enables hidden files and file extensions in Explorer  
- Disables window shaking, startup delay, and recent/frequent items  
- Disables Cortana and Bing integration in Windows Search  
- Removes Windows Copilot and disables transparency effects  
- Disables lock screen and Windows Error Reporting  
- Reduces animation and menu delay for a snappier UI  

### 🛡️ Privacy & Telemetry
- Disables telemetry and data collection  
- Turns off tailored experiences and content suggestions  
- Blocks silent app installs and OEM bloatware recommendations  

### ☁️ OneDrive Removal
- Terminates OneDrive processes  
- Uninstalls OneDrive (both 32-bit and 64-bit versions)  
- Removes leftover folders and registry traces  
- Unpins OneDrive from File Explorer  

### 🚀 Performance
- Disables background apps globally  
- Prevents automatic restarts after updates  
- Excludes driver updates from Windows Update  

## 🧾 Requirements

- **Windows 10 or Windows 11**  
- **Administrator privileges**  
- **Winget** must be installed (included by default in Windows 10 22H2+ and Windows 11)  
- Windows should be **up-to-date** before running

---

## 🚀 Usage

1. **Download the script**  
   ```bash
   git clone https://github.com/<yourusername>/windows-setup-utility.git
   cd windows-setup-utility
