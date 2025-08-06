# PortfolioRP 🎮

A portfolio-worthy FiveM GTA Roleplay Server showcasing modern FiveM development practices, resource integration, and server management skills.

## 🎯 Project Status

### ✅ Completed Features
- **Core Server Setup**: FiveM server configured with latest GTA V build 3407 (Agents of Sabotage DLC)
- **Voice System**: Integrated `pma-voice` 3D proximity voice chat with radio functionality
- **Radio System**: Replaced incompatible `rp-radio` with `ac_radio` (pma-voice compatible)
- **UI Framework**: Implemented `ox_lib` for modern, responsive UI components
- **Roleplay Resources**:
  - `dpemotes`: Comprehensive emote system with animations
  - `mythic_notify`: Clean notification system
  - `simple-admin`: Basic administration tools
  - `SenkaWolf-RPCCPack`: RP chat and command pack
- **Security**: Enhanced `.gitignore` to protect sensitive data (license keys, certificates, passwords)
- **Documentation**: Created comprehensive guides for resources, testing, and voice setup

### 🚧 In Progress
- Custom vehicle system
- Economy framework
- Job system implementation
- Player housing system

### 📊 Technical Details
- **FX Version**: `cerulean` (latest stable)
- **Game Build**: `3407` (December 2024)
- **OneSync**: Enabled (supports 32+ players)
- **Voice System**: pma-voice with 3D spatial audio
- **Max Players**: 32 (configurable)

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
│   └── resources/       # All server resources
│       ├── ac_radio/    # PMA-Voice compatible radio system
│       ├── dpemotes/    # Advanced emote system
│       ├── mythic_notify/ # Notification framework
│       ├── ox_lib/      # Modern UI library
│       ├── pma-voice/   # 3D proximity voice chat
│       ├── simple-admin/ # Admin commands
│       └── [more...]    # Core FiveM resources
├── server.cfg           # Server configuration (gitignored for security)
├── start.bat            # Windows server launcher
├── RESOURCES_INFO.md    # Detailed resource documentation
├── TEST_CHECKLIST.md    # Testing procedures
├── VOICE_GUIDE.md       # Voice system setup guide
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

## 🎮 Available Commands

### Player Commands
- `/radio` - Open radio interface for voice communication
- `/e [emote]` - Play emotes and animations
- `/emotemenu` - Open emote menu interface

### Admin Commands
- `/kick [id] [reason]` - Kick a player
- `/ban [id] [reason]` - Ban a player
- `/announce [message]` - Server-wide announcement
- `/teleport [id]` - Teleport to player
- `/bring [id]` - Bring player to you

## 📚 Resources & Documentation
- [FiveM Documentation](https://docs.fivem.net)
- [FiveM Forum](https://forum.cfx.re)
- [FiveM Natives Reference](https://docs.fivem.net/natives/)
- [Lua Documentation](https://www.lua.org/manual/5.4/)
- [PMA-Voice Documentation](https://github.com/AvarianKnight/pma-voice)
- [Ox Lib Documentation](https://overextended.dev/ox_lib)

## ⚠️ Important Notes
- Never share your license key
- Keep your RCON password secure
- The `server/` folder is gitignored - each developer needs their own copy
- Always test changes locally before deploying

## 🏆 Skills Demonstrated

This project showcases proficiency in:
- **Server Administration**: FiveM server setup, configuration, and maintenance
- **Resource Integration**: Successfully integrated multiple community resources
- **Problem Solving**: Diagnosed and resolved voice system compatibility issues
- **Version Control**: Proper Git usage with security considerations
- **Documentation**: Clear, comprehensive technical documentation
- **System Architecture**: Understanding of client-server architecture in gaming
- **Lua Scripting**: Configuration and modification of Lua-based resources
- **Security Practices**: Proper handling of sensitive configuration data

## 🤝 Contributing
This is a portfolio and learning project. Feel free to explore the code and suggest improvements!
