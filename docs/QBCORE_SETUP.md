# 🎭 QBCore RP Server Setup Guide

## 🎯 What You Now Have

Your server has been transformed into a **complete QBCore roleplay experience** with 20+ integrated resources:

### 🏗️ Framework Foundation
- **QBCore Framework**: Modern RP framework with performance optimization
- **Multi-Character System**: Players can have multiple characters
- **Advanced Spawn System**: Custom spawn selection interface
- **Target System**: Modern interaction system (replaces E key with targeting)
- **Menu System**: Clean UI for all interactions

### 💰 Economy & Banking
- **Banking System**: ATMs, bank transfers, account management
- **Shop System**: Configurable stores throughout the map
- **ox_inventory**: Drag & drop inventory with item metadata
- **Small Resources**: Essential utilities (HUD, commands, notifications)

### 👮 Essential Jobs
Your server now includes these fully-functional careers:

- **👮‍♂️ Police Department**: Complete law enforcement with MDT
- **🚑 EMS/Medical**: Hospital system with injury mechanics
- **🔧 Mechanic Shop**: Vehicle repair and customization
- **🚕 Taxi Service**: Transportation for players

### 🚗 Vehicle Systems
- **Vehicle Keys**: Realistic key management
- **Fuel System**: Vehicles require refueling
- **Vehicle Shop**: Car dealerships for purchases

### 🛠️ Administration
- **Admin Menu**: Comprehensive server management tools
- **Weather Sync**: Server-wide weather synchronization
- **Scoreboard**: Player list and server information

### 👔 Character Features
- **Clothing System**: Advanced clothing shops and customization

## 🚀 Getting Started

### 1. Database Setup
**CRITICAL: You MUST set up MySQL before starting the server**

See `DATABASE_SETUP.md` for detailed instructions.

### 2. First Admin Setup
1. Start the server once with MySQL configured
2. Connect to the server and create your first character
3. Stop the server
4. Find your `citizenid` in the database (`players` table)
5. Add yourself as admin in `server.cfg`:
   ```cfg
   # Replace CITIZENID with your actual citizen ID
   add_ace identifier.license:YOUR_LICENSE group.admin allow
   ```

### 3. Server Configuration
Your `server.cfg` is now configured for QBCore. Key settings:

- **Database**: MySQL connection required
- **Resource Order**: Critical loading sequence maintained
- **Admin Permissions**: Set up admin access properly

## 🎮 In-Game Commands

### Player Commands
- `/radio` - Open radio interface
- `/e [emote]` - Play emotes
- `/emotemenu` - Open emote menu
- `/inventory` - Open inventory (or use assigned key)
- `/bank` - Banking interface
- `/clothing` - Clothing shops
- `/fuel` - At gas stations

### Admin Commands (Requires Admin Permission)
- `/admin` - Open admin menu
- `/noclip` - Toggle noclip mode
- `/tp [id]` - Teleport to player
- `/bring [id]` - Bring player to you
- `/kick [id] [reason]` - Kick player
- `/ban [id] [reason]` - Ban player
- `/unban [identifier]` - Unban player
- `/announce [message]` - Server announcement
- `/weather [type]` - Change weather
- `/time [hour] [minute]` - Set time

### Job-Specific Commands
**Police:**
- `/duty` - Go on/off duty
- `/cuff` - Handcuff nearest player
- `/jail [id] [time]` - Jail player
- `/unjail [id]` - Release player

**EMS:**
- `/duty` - Go on/off duty
- `/revive [id]` - Revive player
- `/heal [id]` - Heal player

**Mechanic:**
- `/duty` - Go on/off duty
- `/repair` - Repair nearby vehicle
- `/clean` - Clean nearby vehicle

## 📋 Server Management

### Setting Up Jobs
1. Players need to be hired through in-game systems
2. Default jobs are set in `qb-core/shared/jobs.lua`
3. Job grades and permissions are configurable

### Managing Economy
- Starting money is configured in `qb-core/config.lua`
- Shop prices are in `qb-shops/config.lua`
- Bank interest rates in `qb-banking/config.lua`

### Vehicle Management
- Vehicle keys are automatically generated
- Fuel consumption is realistic
- Vehicle shops have configurable inventory

## 🔧 Customization

### Adding Custom Jobs
1. Modify `qb-core/shared/jobs.lua`
2. Create job-specific resources if needed
3. Configure permissions and grades

### Custom Vehicles
1. Add vehicles to `qb-core/shared/vehicles.lua`
2. Ensure proper vehicle models are streamed
3. Configure shop availability

### Custom Items
1. Add items to `qb-core/shared/items.lua`
2. Items support metadata for unique properties
3. Configure usability and effects

## 🔐 Security & Performance

### Database Security
- Never expose database credentials
- Use strong passwords
- Regular backups recommended
- Monitor for suspicious activity

### Server Performance
- Resource limit: ~50 players with current setup
- Monitor server resources regularly
- Optimize configs for your player count

### Admin Security
- Limited admin access
- Log all admin actions
- Regular permission audits

## 🐛 Troubleshooting

### Common Issues
**"Database connection failed"**
- Check MySQL service is running
- Verify connection string in server.cfg
- Import qbcore.sql schema

**"Resource failed to start"**
- Check resource order in server.cfg
- Verify all dependencies are installed
- Check server console for specific errors

**"Players can't join"**
- Ensure OneSync is enabled
- Check resource loading order
- Verify database connectivity

### Getting Help
- [QBCore Documentation](https://docs.qbcore.org/)
- [QBCore Discord](https://discord.gg/qbcore)
- [FiveM Forums](https://forum.cfx.re/)

## 🎊 Congratulations!

Your server is now a **professional-grade RP environment** with:
- ✅ Complete job system
- ✅ Realistic economy
- ✅ Advanced inventory
- ✅ Professional admin tools
- ✅ Full player progression
- ✅ Immersive gameplay mechanics

**Time to go live and build your community!** 🚀