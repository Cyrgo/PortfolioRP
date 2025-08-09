local QBCore = exports['qb-core']:GetCoreObject()

-- Debug command to give items with detailed logging
RegisterCommand('debuggive', function(source, args, rawCommand)
    local src = source
    local itemName = args[1] or 'lockpick'
    local amount = tonumber(args[2]) or 1
    
    print('^3[INVENTORY DEBUG] =================^7')
    print('^3[INVENTORY DEBUG] Command: /debuggive ' .. itemName .. ' ' .. amount .. '^7')
    print('^3[INVENTORY DEBUG] Source: ' .. src .. '^7')
    
    -- Check if player exists
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then
        print('^1[INVENTORY DEBUG] ERROR: Player not found for source: ' .. src .. '^7')
        return
    end
    
    print('^2[INVENTORY DEBUG] Player found: ' .. Player.PlayerData.name .. ' (' .. Player.PlayerData.citizenid .. ')^7')
    
    -- Check if item exists in shared items
    local itemData = QBCore.Shared.Items[itemName:lower()]
    if not itemData then
        print('^1[INVENTORY DEBUG] ERROR: Item not found in QBCore.Shared.Items: ' .. itemName .. '^7')
        print('^3[INVENTORY DEBUG] Available items sample:^7')
        local count = 0
        for k, v in pairs(QBCore.Shared.Items) do
            if count < 5 then
                print('  - ' .. k .. ' (' .. v.label .. ')')
                count = count + 1
            end
        end
        return
    end
    
    print('^2[INVENTORY DEBUG] Item found: ' .. itemData.label .. ' (weight: ' .. itemData.weight .. ')^7')
    
    -- Try to add item
    local success = Player.Functions.AddItem(itemName:lower(), amount)
    if success then
        print('^2[INVENTORY DEBUG] SUCCESS: Item added to inventory^7')
        TriggerClientEvent('QBCore:Notify', src, 'Added ' .. amount .. 'x ' .. itemData.label, 'success')
    else
        print('^1[INVENTORY DEBUG] FAILED: Could not add item to inventory^7')
        TriggerClientEvent('QBCore:Notify', src, 'Failed to add item', 'error')
    end
    
    print('^3[INVENTORY DEBUG] =================^7')
end, false)

-- Command to check player's inventory
RegisterCommand('debuginv', function(source, args, rawCommand)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    if not Player then
        print('^1[INVENTORY DEBUG] Player not found^7')
        return
    end
    
    print('^3[INVENTORY DEBUG] Player inventory for: ' .. Player.PlayerData.name .. '^7')
    print('^3[INVENTORY DEBUG] Items:^7')
    
    for k, v in pairs(Player.PlayerData.items) do
        if v and v.name then
            print('  Slot ' .. k .. ': ' .. v.name .. ' x' .. v.amount)
        end
    end
end, false)

-- Simple lockpick give command
RegisterCommand('givelockpick', function(source, args, rawCommand)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
        local success = Player.Functions.AddItem('lockpick', 1)
        if success then
            TriggerClientEvent('QBCore:Notify', src, 'Given lockpick for testing', 'success')
            print('[DEBUG] Gave lockpick to player ' .. src)
        else
            TriggerClientEvent('QBCore:Notify', src, 'Failed to give lockpick', 'error')
        end
    end
end, false)

print('^2[INVENTORY DEBUG] Loaded - use /debuggive [item] [amount], /debuginv, and /givelockpick^7')