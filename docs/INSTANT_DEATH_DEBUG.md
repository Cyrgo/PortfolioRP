# 🩸 INSTANT SUICIDE/BLEED OUT ON SPAWN - DEBUG SESSION

**Date:** August 9, 2025  
**Critical Issue:** Player instantly suicides/bleeds out upon connecting to server  
**Status:** 🔴 UNRESOLVED - Requires database cleanup + systematic testing

---

## 🚨 **THE PROBLEM**

### **Symptoms:**
- ✅ **Instant death on connection** - Player immediately gets "You will bleed out in 300 seconds"
- ✅ **Happens with ANY server config** - Even ultra-minimal vanilla FiveM
- ✅ **Not a resource issue** - Occurs with zero custom resources
- ✅ **Not a keybind issue** - Happens without pressing anything
- ✅ **Character data corruption** - "Can't delete characters" mentioned by user

### **Screenshot Evidence:**
- `/.screenshots/insta-suicide.png` - Shows bleed out timer on ultra-minimal server

---

## 🔍 **DEBUGGING PROGRESS**

### **✅ ELIMINATED Causes:**
1. **Server Resources** - Tested with zero custom resources, still happens
2. **MenuV/Admin Menu** - Disabled all, still happens
3. **QBCore Framework** - Pure vanilla FiveM, still happens
4. **Spawn Manager Config** - Tried multiple configurations
5. **Client Keybinds** - Not a FiveM client keybind issue
6. **Custom Scripts** - Removed all custom spawn fixes

### **🎯 LIKELY CAUSE: Corrupted Character Database**
**Evidence:**
- User mentioned "can't delete characters" 
- Character ID 'QCU66525' seen in logs
- Instant death persists across ALL server configurations
- Classic sign of corrupted character health/death state in database

---

## 📋 **IMMEDIATE NEXT STEPS**

### **1. DATABASE CHARACTER CLEANUP** 🗑️
**CRITICAL: Must do this first before any testing**

**In phpMyAdmin, select `qbcore_database`, then run:**

```sql
-- Check current character data
SELECT citizenid, name FROM users WHERE citizenid LIKE 'QCU%';

-- Delete corrupted character (replace 'QCU66525' with actual ID)
DELETE FROM users WHERE citizenid = 'QCU66525';
DELETE FROM playerskins WHERE citizenid = 'QCU66525';
DELETE FROM crypto_transactions WHERE citizenid = 'QCU66525';
DELETE FROM phone_invoices WHERE citizenid = 'QCU66525';

-- Verify deletion
SELECT COUNT(*) FROM users;
```

**⚠️ Alternative Nuclear Option (if specific deletion doesn't work):**
```sql
-- Clear ALL character data (creates fresh start)
TRUNCATE TABLE users;
TRUNCATE TABLE playerskins;
TRUNCATE TABLE crypto_transactions;
TRUNCATE TABLE phone_invoices;
```

### **2. TEST WITH ULTRA-MINIMAL CONFIG** 🧪

**Use:** `server-ultra-minimal.cfg`

**Current Ultra-Minimal Config:**
```cfg
# Ultra Minimal Config - Testing Death Issue
endpoint_add_tcp "0.0.0.0:30120"
endpoint_add_udp "0.0.0.0:30120"
sv_licenseKey "cfxk_E3s7Q34PUEYH2d3sSCR5_4FZlFu"
sv_hostname "PortfolioRP - Ultra Minimal"
sv_maxclients 32

# ONLY Essential FiveM (no QBCore at all)
ensure mapmanager
ensure spawnmanager
ensure sessionmanager
ensure hardcap
ensure chat

# Admin
add_ace group.admin command allow
add_principal identifier.steam:* group.admin

# Spawn settings
setr spawnmanager_spawnPos "-1042.0, -2745.0, 21.35"
setr spawnmanager_autoSpawn true
setr spawnmanager_forceRespawn true
setr spawnmanager_respawnDelay 2000

# Disable problematic features
set sv_disableKillTriggers true
set sv_scriptHookAllowed 0

# Basic settings
sv_enforceGameBuild 3407
set onesync on
```

**Test Command:**
```bash
cd server
FXServer.exe +exec ../server-ultra-minimal.cfg
```

### **3. SYSTEMATIC RESOURCE ADDITION** 📈

**IF ultra-minimal works (no instant death), add resources in this exact order:**

#### **Phase 1: Database + Core**
```cfg
ensure oxmysql
ensure ox_lib
ensure qb-core
```

#### **Phase 2: Character System**
```cfg
ensure qb-multicharacter
ensure qb-spawn
```

#### **Phase 3: Essential UI**
```cfg
ensure qb-target
ensure qb-menu
```

#### **Phase 4: Health System**
```cfg
ensure qb-ambulancejob
ensure qb-smallresources
```

**⚠️ STOP and test after each phase. Note which phase breaks it.**

---

## 🗂️ **FILE LOCATIONS**

### **Server Configs:**
- **Main (Broken):** `server.cfg`  
- **Minimal (Test):** `server-minimal.cfg`
- **Ultra-Minimal (Debug):** `server-ultra-minimal.cfg` ⭐

### **Database Files:**
- **Core Tables:** `missing_tables.sql`
- **Additional:** `additional_fixes.sql`

### **Debug Resources Created:**
- **Custom Spawn Fix:** `server/resources/fix-spawn/` (NOT WORKING - removed)

---

## 🎯 **SUCCESS CRITERIA**

### **Target Goal:**
- ✅ Player connects without instant death
- ✅ Player spawns alive and healthy  
- ✅ Can create new character normally
- ✅ No "bleed out" timer on spawn

### **Final Objective:**
- 🔄 Work back to full `server.cfg` functionality
- 🔄 Identify which resource caused the original issue
- 🔄 Implement proper fix for that resource

---

## 📊 **DEBUGGING THEORY**

**Most Likely Scenario:**
1. **Character data got corrupted** during our earlier database work
2. **Health/death state** stored as "dead" in database  
3. **Every spawn loads corrupted data** causing instant death
4. **Persists across all configs** because data comes from database

**Alternative Scenarios:**
- FiveM client cache corruption (less likely given testing)
- Windows/System issue (very unlikely)
- Network/connection issue (possible but unlikely)

---

## 🔄 **RESUME SESSION SCRIPT**

**When you return, say:**

*"I'm back to continue debugging the instant death issue. I need to:*
*1. Clear the corrupted character data from the database first*  
*2. Test with ultra-minimal config to confirm fix*
*3. Then systematically add resources back until we find the culprit*
*Should I start with the database cleanup?"*

---

## ⚠️ **CRITICAL REMINDERS**

1. **ALWAYS test database cleanup FIRST** - Don't skip this step
2. **One resource at a time** - Don't rush the systematic addition  
3. **Document what breaks it** - Note exactly which resource causes the issue
4. **Keep ultra-minimal config** - It's our working baseline
5. **The goal is finding the ROOT CAUSE** - Not just a workaround

---

## 🏁 **EXPECTED RESOLUTION PATH**

**Database cleanup → Ultra-minimal works → Add resources systematically → Find culprit → Fix/replace problematic resource → Full server functional**

**The instant death issue is almost certainly corrupted character data in the database. Once cleaned, we should be able to work back to full functionality.** 🎯

---

*Good night! This issue is solvable - we just need to clear the corrupted character data and rebuild systematically.* 😴