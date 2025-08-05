# PortfolioRP
A portfolio worthy FiveM GTA Roleplay Server! This project is my attempt at learning FiveM Development!

## 🚀 Quick Start Guide

### Prerequisites
- Windows 10/11
- [Visual C++ Redistributables](https://aka.ms/vs/17/release/vc_redist.x64.exe)
- [7-Zip](https://www.7-zip.org/) or WinRAR
- A web browser

### Setup Instructions

#### 1. Get a License Key
1. Visit [FiveM Keymaster](https://keymaster.fivem.net)
2. Sign in with your Cfx.re account
3. Create a new server key
4. Copy your license key (starts with `cfxk_`)

#### 2. Download Server Files
1. Go to [FiveM Server Artifacts](https://runtime.fivem.net/artifacts/fivem/build_server_windows/master/)
2. Download the latest recommended build (usually the top one)
3. Extract the `.7z` file into the `server/` folder in this project

#### 3. Configure Your Server
1. Open `server.cfg` in a text editor
2. Replace `YOUR_LICENSE_KEY_HERE` with your actual license key
3. Change `CHANGE_THIS_PASSWORD` to a secure RCON password
4. Save the file

#### 4. Start Your Server
1. Double-click `start.bat`
2. The server will start and show in the console
3. Wait for "Server started" message

#### 5. Connect to Your Server
1. Open FiveM
2. Press F8 to open console
3. Type: `connect localhost:30120`
4. Press Enter

## 📁 Project Structure
```
PortfolioRP/
├── server/              # FiveM server files (download separately)
├── resources/           # Custom resources and scripts
├── server.cfg           # Server configuration
├── start.bat            # Windows startup script
└── README.md            # This file
```

## 🔧 Common Tasks

### Adding Resources
1. Place resource folders in `resources/`
2. Add `ensure [resource-name]` to `server.cfg`
3. Restart the server

### Opening Server Ports
If hosting for others, open port 30120 (TCP/UDP) in Windows Firewall:
```powershell
netsh advfirewall firewall add rule name="FiveM Server" dir=in action=allow protocol=TCP localport=30120
netsh advfirewall firewall add rule name="FiveM Server" dir=in action=allow protocol=UDP localport=30120
```

### Finding Your Server
- Local: `connect localhost:30120` in F8 console
- LAN: Use your local IP (e.g., `connect 192.168.1.100:30120`)
- Public: Configure port forwarding on your router

## 🛠️ Development Tips

### Creating Your First Resource
1. Create a folder in `resources/` (e.g., `my-first-script`)
2. Create `fxmanifest.lua`:
```lua
fx_version 'cerulean'
game 'gta5'

author 'Your Name'
description 'My First Resource'
version '1.0.0'

client_script 'client.lua'
server_script 'server.lua'
```
3. Add your Lua scripts
4. Add `ensure my-first-script` to `server.cfg`

### Useful Commands
- `restart [resource]` - Restart a specific resource
- `refresh` - Refresh resource list
- `stop [resource]` - Stop a resource
- `start [resource]` - Start a resource

## 📚 Resources
- [FiveM Documentation](https://docs.fivem.net)
- [FiveM Forum](https://forum.cfx.re)
- [FiveM Natives Reference](https://docs.fivem.net/natives/)
- [Lua Documentation](https://www.lua.org/manual/5.4/)

## ⚠️ Important Notes
- Never share your license key
- Keep your RCON password secure
- The `server/` folder is gitignored - each developer needs their own copy
- Always test changes locally before deploying

## 🤝 Contributing
This is a learning project. Feel free to experiment and break things!
