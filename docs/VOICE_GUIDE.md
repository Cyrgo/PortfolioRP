# FiveM Voice Chat Guide - pma-voice

## What is pma-voice?
- **Most popular voice system** for FiveM RP servers (80%+ of servers use it)
- **3D spatial audio** - voice gets quieter with distance
- **Realistic audio effects** - echo, reverb, radio effects
- **Multiple voice ranges** - whisper, normal, shout
- **Radio integration** - works with rp-radio for team communication

## Voice Controls (Default Keybinds)

### Basic Voice
- **Push to Talk**: `N` key (hold to talk)
- **Voice Range Cycle**: `F10` (cycles through whisper → normal → shout)
- **Mute/Unmute**: `F9`

### Voice Ranges
1. **Whisper** - ~3 meters range (quiet conversations)
2. **Normal** - ~8 meters range (regular talking)  
3. **Shout** - ~15 meters range (calling across street)

### Radio (with rp-radio)
- **Radio Push to Talk**: `Caps Lock` (when you have radio)
- **Radio Menu**: `Caps Lock` (to set frequency)
- **Give Radio**: F8 console → `exports["rp-radio"]:SetRadio(true)`

## Testing Voice Chat

### Before You Start:
1. **Check your microphone** - Make sure Windows detects it
2. **FiveM audio settings** - Enable voice in FiveM settings
3. **Server connection** - Voice only works when connected to server

### Voice Test Steps:

1. **Connect to server**: `connect localhost:30120`

2. **Test basic voice**:
   - Hold `N` and speak
   - You should see a voice indicator appear
   - Ask another player if they can hear you

3. **Test voice ranges**:
   - Press `F10` to cycle: Whisper → Normal → Shout
   - Notice the voice icon changes
   - Walk away from other players to test distance

4. **Test radio** (if you have one):
   - F8 console: `exports["rp-radio"]:SetRadio(true)`
   - Press `Caps Lock` to open radio menu
   - Set frequency (like channel 1)
   - Hold `Caps Lock` to talk on radio

## Roleplay Voice Etiquette

### Good RP Voice Practices:
- **Stay in character** when speaking
- **Use appropriate voice range** (whisper for secrets, shout for emergencies)
- **Don't talk over others** excessively
- **Use radio properly** (police/EMS channels)

### Voice Range Guidelines:
- **Whisper**: Private conversations, secrets, stealth
- **Normal**: Regular conversation, most RP interactions  
- **Shout**: Emergencies, calling for help, crowd control

## Troubleshooting

### "I can't hear anyone":
- Check FiveM audio settings (Voice enabled?)
- Check Windows microphone permissions for FiveM
- Try different voice ranges with F10

### "Nobody can hear me":
- Hold N properly (push-to-talk)
- Check Windows microphone levels
- Make sure you're not muted (F9 to unmute)

### "Voice is choppy/laggy":
- Check internet connection
- Try lowering voice quality in FiveM settings
- Server might be under load

### "Radio doesn't work":
- Make sure you have radio: `exports["rp-radio"]:SetRadio(true)`
- Check if pma-voice started properly in server console
- Try restarting the server

## Advanced Features

### For Server Admins:
- **Voice ranges are configurable** in pma-voice config
- **Radio frequencies** can be restricted by job/group  
- **3D audio effects** can be customized per location
- **Export functions** available for other scripts

### Integration with Other Scripts:
- Works with **all RP frameworks** (ESX, QBCore, etc.)
- Compatible with **job systems** (police radio channels)
- Integrates with **phone systems** (phone calls)
- Supports **proximity-based features**

## Why pma-voice is Best for RP:

1. **Immersive**: 3D spatial audio makes RP feel real
2. **Professional**: Used by biggest RP servers (NoPixel, etc.)
3. **Reliable**: Active development, regular updates
4. **Free**: Open source, no licensing costs
5. **Feature-rich**: Whisper/shout, radio, phone integration
6. **Performance**: Optimized for large servers (1000+ players)

Your server now has **professional-grade voice chat** that rivals the biggest RP servers!