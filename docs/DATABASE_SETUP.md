# 🗄️ Database Setup Guide

## Prerequisites
QBCore framework requires MySQL/MariaDB for player data storage.

## 🚀 Quick Start Options (2025 Recommendations)

### Option A: Laragon (⭐ Most Recommended)

**Why Laragon?** Faster, lighter, and more beginner-friendly than XAMPP.

#### 1. Download & Install
- Go to [Laragon Download](https://laragon.org/download/)
- Download "Laragon - Full" (includes MySQL, PHP, Apache)
- Install with default settings

#### 2. Start Services
- Open Laragon
- Click "Start All" (Apache + MySQL start automatically)
- Services turn green when running

#### 3. Install phpMyAdmin (Required First Time)
Laragon doesn't include phpMyAdmin by default, so install it first:
- Right-click Laragon tray icon → Tools → Quick add → phpMyAdmin
- Wait for download to complete
- **Restart Laragon completely** (quit and reopen)
- Start all services again

#### 4. Create Database
- Click "Database" button in Laragon main window
- OR visit `http://localhost/phpmyadmin`
- Login: Username `root`, Password: leave blank
- Click "New" → Database name: `qbcore_database`
- Collation: `utf8mb4_general_ci` → Create

#### 5. Update Server Config
```cfg
# Enable database
ensure oxmysql

# Connection string (Laragon default - no password)
set mysql_connection_string "mysql://root@localhost/qbcore_database?charset=utf8mb4"
```

### Option B: WampServer (Windows-Optimized)

#### 1. Download & Install
- Go to [WampServer Download](https://wampserver.aviatechno.net/)
- Download latest version for Windows
- Install (may require Visual C++ redistributables)

#### 2. Start Services
- Click WampServer tray icon
- Services show green when running
- Click "phpMyAdmin" to access database

#### 3. Create Database
- Access phpMyAdmin from tray menu
- Create new database: `qbcore_database`
- Use same connection string as Laragon above

### Option C: EasyPHP (Zero Configuration)

Perfect if you want **zero setup hassle**:

#### 1. Download & Install
- Go to [EasyPHP Download](https://www.easyphp.org/)
- Download "EasyPHP Devserver"
- Install and auto-configures everything

#### 2. Use Built-in Tools
- Opens automatically with web interface
- Database management included
- Built-in tutorials for beginners

## Alternative: Standalone MySQL Installation

### Windows (MySQL Installer)
1. Download [MySQL Installer](https://dev.mysql.com/downloads/installer/)
2. Choose "Custom" installation
3. Install MySQL Server 8.0 and optionally MySQL Workbench
4. Set root password (remember this!)
5. Create database:
   ```sql
   CREATE DATABASE qbcore_database CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
   ```
6. Update connection string with your password:
   ```cfg
   set mysql_connection_string "mysql://root:yourpassword@localhost/qbcore_database?charset=utf8mb4"
   ```

## ❌ Why Not XAMPP in 2025?

- **Resource Heavy**: Uses more RAM and CPU than alternatives
- **Configuration Issues**: Frequent port conflicts and setup problems  
- **Complex Setup**: Manual configuration can be confusing for beginners
- **Outdated Interface**: Less user-friendly than modern alternatives

## Cloud Database Options (Production)

### Recommended Providers
- **Hostinger MySQL** - Affordable, reliable
- **PlanetScale** - Serverless, developer-friendly  
- **DigitalOcean MySQL** - Managed database service

### Connection String Template
```cfg
set mysql_connection_string "mysql://username:password@host:port/database?charset=utf8mb4"
```

## Database Schema Setup

1. **Import QBCore Schema**
   ```sql
   -- Import: /server/resources/qb-core/qbcore.sql
   ```

2. **Verify Tables Created**
   - `players` - Main player data
   - Additional tables will be added by other resources

## Security Notes

⚠️ **NEVER commit database credentials to Git!**

- Database connection string is in `server.cfg` (gitignored)
- Change default MySQL passwords
- Use strong passwords for production
- Enable SSL for remote connections

## Troubleshooting

### Common Errors
- **"Can't connect to MySQL"** - Check connection string
- **"Table doesn't exist"** - Import qbcore.sql schema  
- **"Access denied"** - Verify username/password

### Test Connection
```lua
-- In server console
MySQL.ready(function()
    print("Database connected successfully!")
end)
```

## What Database Enables

Once MySQL is connected, you'll have:
- ✅ Character persistence (save/load characters)
- ✅ Inventory saves items between sessions  
- ✅ Job progression and ranks
- ✅ Vehicle ownership and keys
- ✅ Banking with persistent money
- ✅ Property ownership
- ✅ Admin logs and player records

## Production Checklist

- [ ] MySQL/MariaDB installed and running
- [ ] Database created with proper charset (utf8mb4)
- [ ] QBCore schema imported
- [ ] Connection string configured
- [ ] Database user has proper permissions
- [ ] Firewall configured (if using remote DB)
- [ ] SSL enabled for remote connections
- [ ] Regular database backups scheduled