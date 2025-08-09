-- Debug spawn health issues
local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
    while true do
        Wait(1000) -- Check every second
        
        local ped = PlayerPedId()
        local health = GetEntityHealth(ped)
        local maxHealth = GetEntityMaxHealth(ped)
        
        if health <= 100 then -- Player is dead/dying
            print('^1[SPAWN DEBUG] Player health critical: ' .. health .. '/' .. maxHealth .. '^7')
            
            -- Log what might be causing death
            if IsPedDeadOrDying(ped, true) then
                print('^1[SPAWN DEBUG] Player is flagged as dead/dying^7')
            end
            
            if GetPedCauseOfDeath(ped) ~= 0 then
                print('^1[SPAWN DEBUG] Cause of death: ' .. GetPedCauseOfDeath(ped) .. '^7')
            end
        end
    end
end)

-- Monitor all health changes
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    print('^2[SPAWN DEBUG] Player loaded event triggered^7')
    
    CreateThread(function()
        for i = 1, 10 do -- Monitor for 10 seconds after load
            Wait(1000)
            local ped = PlayerPedId()
            local health = GetEntityHealth(ped)
            local maxHealth = GetEntityMaxHealth(ped)
            print('^3[SPAWN DEBUG] Health check ' .. i .. ': ' .. health .. '/' .. maxHealth .. '^7')
        end
    end)
end)

-- Monitor multicharacter events
RegisterNetEvent('qb-multicharacter:client:closeNUIdefault', function()
    print('^2[SPAWN DEBUG] Character spawn (default) triggered^7')
end)

RegisterNetEvent('qb-multicharacter:client:spawnLastLocation', function()
    print('^2[SPAWN DEBUG] Character spawn (last location) triggered^7')
end)

print('^2[SPAWN DEBUG] Loaded - monitoring health changes^7')