-- Check and create missing tables for character deletion
CreateThread(function()
    Wait(5000) -- Wait for MySQL to be ready
    
    -- Check if tables exist first
    MySQL.query('SHOW TABLES LIKE "phone_messages"', {}, function(phoneResult)
        MySQL.query('SHOW TABLES LIKE "player_mails"', {}, function(mailResult)
            local phoneExists = phoneResult and #phoneResult > 0
            local mailExists = mailResult and #mailResult > 0
            
            if phoneExists and mailExists then
                print('^2[FIX-DELETION] All required tables already exist^7')
                return
            end
            
            print('^3[FIX-DELETION] Creating missing database tables...^7')
            
            if not phoneExists then
                -- Create phone_messages table
                MySQL.query([[
                    CREATE TABLE IF NOT EXISTS `phone_messages` (
                        `id` int(11) NOT NULL AUTO_INCREMENT,
                        `citizenid` varchar(50) DEFAULT NULL,
                        `number` varchar(50) DEFAULT NULL,
                        `messages` text DEFAULT NULL,
                        PRIMARY KEY (`id`),
                        KEY `citizenid` (`citizenid`)
                    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4
                ]], {}, function(result)
                    if result then
                        print('^2[FIX-DELETION] Created phone_messages table^7')
                    else
                        print('^1[FIX-DELETION] Failed to create phone_messages table^7')
                    end
                end)
            end
            
            if not mailExists then
                -- Create player_mails table
                MySQL.query([[
                    CREATE TABLE IF NOT EXISTS `player_mails` (
                        `id` int(11) NOT NULL AUTO_INCREMENT,
                        `citizenid` varchar(50) DEFAULT NULL,
                        `sender` varchar(50) DEFAULT NULL,
                        `subject` varchar(50) DEFAULT NULL,
                        `message` text DEFAULT NULL,
                        `read` tinyint(4) DEFAULT 0,
                        `mailid` int(11) DEFAULT NULL,
                        `date` timestamp NULL DEFAULT current_timestamp(),
                        `button` text DEFAULT NULL,
                        PRIMARY KEY (`id`),
                        KEY `citizenid` (`citizenid`)
                    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4
                ]], {}, function(result)
                    if result then
                        print('^2[FIX-DELETION] Created player_mails table^7')
                    else
                        print('^1[FIX-DELETION] Failed to create player_mails table^7')
                    end
                end)
            end
            
            print('^2[FIX-DELETION] Table creation completed^7')
        end)
    end)
end)