# PortfolioRP 🎮

A portfolio-worthy FiveM GTA Roleplay Server showcasing modern FiveM development practices, resource integration, and server management skills.

## 🎯 Project Status

### ✅ Completed Features
- **🏗️ QBCore Framework**: Complete RP framework with multi-character support
- **📦 Inventory System**: Official qb-inventory with full weapon support COULD BE BETTER
- **🎯 Interaction Systems**: qb-target, qb-menu for modern interactions NOT TESTED  
- **💰 Economy**: Banking, shops with working transactions BUGGY
- **👮 Essential Jobs**: Police, EMS, Mechanic, Taxi with full functionality TODO
- **🚗 Vehicle Systems**: Working lockpicking, hotwiring, and key management KEYS NOT MANAGED
- **🛠️ Admin Tools**: Comprehensive admin menu, weather sync, scoreboard
- **👔 Character Systems**: Advanced clothing and appearance customization COULD BE IMPROVED
- **🔊 Voice & Communication**: pma-voice 3D proximity voice with ac_radio NOT TESTED
- **🎭 Roleplay Resources**: Complete emote system (dpemotes), notifications, consumables EMOTES WORK CONSUMABLED BUGGY
- **🔐 Security**: Enhanced `.gitignore`, database protection, admin permissions
- **📚 Documentation**: Complete setup guides and troubleshooting resources

### 🔧 Recent Fixes & Improvements (December 2024)
- **✅ Fixed instant death bug**: Players no longer die from fall damage during character selection
- **✅ Fixed character deletion**: Added missing database tables for proper character cleanup
- **✅ Fixed inventory system**: Properly configured qb-inventory with qb-weapons integration
- **✅ Fixed melee weapons**: Bats and other melee weapons now work correctly
- **✅ Fixed vehicle lockpicking**: Removed progressbar dependency, added proper animations
- **✅ Fixed vehicle hotwiring**: Reduced time from 20-40s to 5-8s, increased success rate to 70%
- **✅ Fixed consumables**: Joint smoking now uses dpemotes with visible prop
- **✅ Added debug tools**: Custom commands for testing items and inventory
- **✅ Database optimization**: Fixed table creation spam on server startup
- **✅ Shop system**: Fixed integration with proper price handling

### 🐛 Known Issues & TODO
- **Progressbar System**: Need to add a progressbar resource (qb-progressbar or similar)
- **Shop Prices**: Some items may show incorrect prices (debugging added)
- **Missing Resources**: qb-apartments, qb-spawn need configuration
- **Phone System**: No phone system currently installed
- **Housing**: qb-houses not yet configured
- **Minigames**: Need to add qb-skillbar or similar for lockpicking minigames

### 📊 Technical Details
- **Framework**: QBCore (modern RP framework)
- **Database**: MySQL with oxmysql integration
- **FX Version**: `cerulean` (latest stable)
- **Game Build**: `3407` (December 2024 - Agents of Sabotage DLC)
- **OneSync**: Enabled (supports 32+ players)
- **Voice System**: pma-voice with 3D spatial audio + radio
- **Inventory**: ox_inventory (drag & drop with metadata)
- **Resources**: 25+ integrated RP resources

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
│       ├── oxmysql/     # Database integration
│       ├── ox_lib/      # Modern UI library
│       ├── ox_inventory/ # Advanced inventory system
│       ├── qb-core/     # QBCore framework foundation
│       ├── qb-target/   # Interaction system
│       ├── qb-menu/     # Menu system
│       ├── qb-banking/  # Banking system
│       ├── qb-shops/    # Shop system
│       ├── qb-policejob/ # Police job system
│       ├── qb-ambulancejob/ # EMS job system
│       ├── qb-mechanicjob/ # Mechanic job system
│       ├── qb-vehiclekeys/ # Vehicle key system
│       ├── qb-fuel/     # Fuel system
│       ├── qb-adminmenu/ # Admin tools
│       ├── pma-voice/   # 3D proximity voice chat
│       ├── ac_radio/    # Radio communication
│       └── [15+ more]   # Additional RP resources
├── docs/                # Documentation files
│   ├── DATABASE_SETUP.md    # MySQL setup instructions
│   ├── MYSQL_WORKBENCH_SETUP.md # MySQL Workbench guide
│   ├── QBCORE_SETUP.md      # Complete QBCore guide
│   ├── QUICK_MYSQL_SETUP.md # Quick MySQL setup
│   ├── RESOURCES_INFO.md    # Resource documentation
│   ├── SQLITE_DEV.md        # SQLite development guide
│   ├── TEST_CHECKLIST.md    # Testing procedures
│   └── VOICE_GUIDE.md       # Voice system setup guide
├── server.cfg           # Server configuration (gitignored for security)
├── start.bat            # Windows server launcher
├── CLAUDE.md            # AI assistant guidance
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
- `/inventory` - Open advanced drag & drop inventory
- `/bank` - Access banking interface
- `/clothing` - Visit clothing stores
- `/duty` - Go on/off duty for jobs
- `/fuel` - Refuel vehicle at gas stations

### Admin Commands
- `/admin` - Open comprehensive admin menu
- `/noclip` - Toggle noclip mode
- `/kick [id] [reason]` - Kick a player
- `/ban [id] [reason]` - Ban a player
- `/announce [message]` - Server-wide announcement
- `/tp [id]` - Teleport to player
- `/bring [id]` - Bring player to you
- `/weather [type]` - Change server weather
- `/time [hour] [minute]` - Set server time

### Debug Commands (Development)
- `/debuggive [item] [amount]` - Give yourself any item with detailed logging
- `/debuginv` - Check your inventory contents in console
- `/givelockpick` - Quick command to give yourself a lockpick for testing
- `/heal` - Heal yourself to full health
- `/car [vehicle]` - Spawn a vehicle
- `/fix` - Repair current vehicle
- `/god` - Toggle god mode

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

