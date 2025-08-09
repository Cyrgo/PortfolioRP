-- Database table check for character deletion
local tablesToCheck = {
    'players',
    'apartments', 
    'bank_accounts',
    'crypto_transactions',
    'phone_invoices',
    'phone_messages', 
    'playerskins',
    'player_contacts',
    'player_houses',
    'player_mails',
    'player_outfits',
    'player_vehicles'
}

CreateThread(function()
    Wait(10000) -- Wait longer for MySQL to be ready
    
    -- Check if MySQL is available
    if not MySQL then
        print('^1[DB-CHECK] ERROR: MySQL not available. Make sure oxmysql is loaded.^7')
        return
    end
    
    print('^3[DB-CHECK] Checking database tables required for character deletion...^7')
    
    for _, tableName in pairs(tablesToCheck) do
        MySQL.query('SHOW TABLES LIKE ?', {tableName}, function(result)
            if result and #result > 0 then
                print('^2[DB-CHECK] Table exists: ' .. tableName .. '^7')
            else
                print('^1[DB-CHECK] Table MISSING: ' .. tableName .. '^7')
            end
        end)
    end
    
    -- Also check for any characters in the database
    MySQL.query('SELECT COUNT(*) as count FROM players', {}, function(result)
        if result and result[1] then
            print('^3[DB-CHECK] Total characters in database: ' .. result[1].count .. '^7')
        else
            print('^1[DB-CHECK] Could not count characters - players table may be missing^7')
        end
    end)
end)