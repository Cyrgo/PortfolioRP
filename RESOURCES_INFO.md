# Installed FiveM Resources

## Standalone Resources ([standalone] folder)

### 1. SenkaWolf-RPCCPack
- **Description**: Standalone RP Chat & Command Basic Pack
- **Features**:
  - Proximity and global chat (/ooc, /me, /do, /ad, /twt, /darkweb)
  - Basic animations (/hu hands up, /huk hands up kneel, /point, /crouch)
  - Vehicle controls (/hood, /trunk, /dv delete vehicle)
  - Emote system with /emotes list
- **Source**: https://github.com/SenkaWolf/FiveM_Standalone-RP-Chat-Command-Basic-Pack

### 2. mythic_notify
- **Description**: Simple notification system for FiveM
- **Features**:
  - Clean notification UI
  - Standard alerts with customizable duration
  - Persistent notifications that stay on screen until cleared
- **Source**: https://github.com/JayMontana36/mythic_notify

### 3. simple-admin
- **Description**: Custom simple admin commands for basic server management
- **Features**:
  - Player healing (/heal)
  - Vehicle spawning (/car [vehicle])
  - Teleportation (/tp [x] [y] [z])
  - God mode toggle (/god)
  - Vehicle repair (/fix)
- **Source**: Custom built for PortfolioRP
- **Note**: Requires admin permissions (already configured)

## Roleplay Resources ([rp] folder)

### 4. dpemotes
- **Description**: Comprehensive emote system with 390+ emotes
- **Features**:
  - Dances, expressions, and animations
  - Prop support
  - Shared/synchronized emotes with other players
  - Keybinding support
  - Persistent walkstyles
- **Source**: https://github.com/andristum/dpemotes
- **Commands**: /emotes, /e [emotename], /walk [style]

### 5. rp-radio
- **Description**: In-game radio system using mumble-voip
- **Features**:
  - Radio channels for team communication
  - Can be used as an in-game item
  - Integrates with voice chat system
- **Source**: https://github.com/FrazzIe/rp-radio
- **Note**: Disabled by default, needs to be given as an item to players

## Server Configuration

All resources have been added to `server.cfg` and will automatically start when the server launches.

## Testing the Server

To test the server with new resources:
1. Run `start.bat` or navigate to server folder and run `FXServer.exe +exec ../server.cfg`
2. Connect to the server using FiveM client (F8 → `connect localhost:30120`)
3. Test commands:
   - Chat: `/me tests the chat`, `/ooc Hello everyone!`
   - Emotes: `/emotes` to see list, `/e dance` to dance
   - Admin: Press M to open vMenu (requires admin permissions)

## Next Steps

Consider adding:
- **Economy System**: Banking, money, shops
- **Job System**: Police, EMS, mechanics, etc.
- **Inventory System**: Item management
- **Phone System**: For player communication
- **Housing System**: Player-owned properties
- **Vehicle System**: Garages, ownership, modifications

## Framework Options for Future

When ready for more advanced features, consider:
- **QBCore**: Most popular, well-documented, 600+ stars on GitHub
- **ESX**: Older but stable, large community
- **Standalone Development**: Continue building custom resources without framework