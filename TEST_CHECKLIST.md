# FiveM Server Testing Checklist

## Server Startup
- [ ] Run `start.bat` from project root
- [ ] Wait for "Server license key authentication succeeded" message
- [ ] Check for any red error messages in console

## Connect to Server
- [ ] Open FiveM client
- [ ] Press F8 for console
- [ ] Type: `connect localhost:30120`
- [ ] Wait for game to load

## Test Each Resource

### SenkaWolf RP Chat Pack
- [ ] `/ooc test` - Should show OOC chat
- [ ] `/me waves` - Should show action text
- [ ] `/hu` - Should put hands up
- [ ] `/point` - Should point
- [ ] Spawn a car (via vMenu) then test:
  - [ ] `/hood` - Opens hood
  - [ ] `/trunk` - Opens trunk
  - [ ] `/dv` - Deletes vehicle

### dpemotes
- [ ] `/emotes` - Should show emote menu
- [ ] `/e dance` - Should make character dance
- [ ] `/e sit` - Should sit down
- [ ] `/walk drunk` - Should change walk style
- [ ] Press X to cancel emote

### Simple Admin Commands
- [ ] `/heal` - Should heal and give armor
- [ ] `/car adder` - Should spawn an Adder car
- [ ] `/tp -1037 -2738` - Should teleport to location
- [ ] `/god` - Should toggle god mode on/off
- [ ] Get in a car and damage it, then `/fix` - Should repair vehicle

### mythic_notify
In F8 console, paste:
- [ ] `exports['mythic_notify']:DoHudText('inform', 'Test notification')`
- [ ] Should see notification appear on screen

### rp-radio
In F8 console:
- [ ] `exports["rp-radio"]:SetRadio(true)` - Gives radio
- [ ] Press Caps Lock - Radio menu should open
- [ ] Set frequency to 1
- [ ] Hold N to talk

## Common Issues & Fixes

### "Resource not found" errors
- Check that resources are in correct folders
- Verify `server.cfg` has correct paths

### vMenu not opening
- Make sure you added admin permissions in server.cfg
- Restart server after config changes

### Commands not working
- Some commands require being in a vehicle
- Check F8 console for error messages

### Can't connect to server
- Ensure server is running (check console)
- Firewall might be blocking port 30120
- Try `connect 127.0.0.1:30120` instead

## Console Commands for Testing
```
restart [resource-name]  # Restart specific resource
refresh                  # Refresh all resources
resources               # List all resources
start [resource-name]   # Start a stopped resource
stop [resource-name]    # Stop a running resource
```

## Checking Resource Status
In server console, type:
- `resources` - Shows all loaded resources
- Green = Running
- Yellow = Starting
- Red = Error