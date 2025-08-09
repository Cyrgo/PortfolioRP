# 🗄️ Database Setup Guide

## Prerequisites
QBCore framework requires MySQL/MariaDB for player data storage.

## 🚀 Quick Start: XAMPP (Easiest for Development)

### 1. Download & Install
- Go to [XAMPP Download](https://www.apachefriends.org/download.html)
- Download XAMPP for Windows
- Install with default settings

### 2. Start MySQL
- Open XAMPP Control Panel
- Click "Start" next to MySQL
- Should show "Running" in green

### 3. Create Database
- Click "Admin" next to MySQL (opens phpMyAdmin)
- Click "New" on left sidebar
- Database name: `qbcore_database`
- Collation: `utf8mb4_general_ci`
- Click "Create"

### 4. Update Server Config
In your `server.cfg`, uncomment and update:
```cfg
# Enable database
ensure oxmysql

# Set connection string (XAMPP default - no password)
set mysql_connection_string "mysql://root@localhost/qbcore_database?charset=utf8mb4"
```

### 5. Start Server
- Run `start.bat`
- QBCore will auto-create all tables
- Character data will now save properly

## Option 1: Full MySQL Installation (Alternative)

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

## Option 2: Cloud Database (Production)

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