local QBCore = exports['qb-core']:GetCoreObject()
local hasHealed = false

-- Auto-heal on character load
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    Wait(2000) -- Wait for everything to initialize
    
    local playerPed = PlayerPedId()
    local health = GetEntityHealth(playerPed)
    
    if health <= 100 and not hasHealed then -- If player is dead/dying
        print("^3[AutoHeal] Player spawned with low health (" .. health .. "), healing...^7")
        
        -- Heal player
        SetEntityHealth(playerPed, 200)
        SetPedArmour(playerPed, 100)
        
        -- Clear death state
        TriggerEvent('hospital:client:Revive')
        
        hasHealed = true
        print("^2[AutoHeal] Player healed successfully^7")
    end
end)

-- Also try on spawn
AddEventHandler('onClientGameTypeStart', function()
    Wait(5000) -- Wait longer for full initialization
    
    if not hasHealed then
        local playerPed = PlayerPedId()
        local health = GetEntityHealth(playerPed)
        
        if health <= 100 then
            print("^3[AutoHeal] Late heal triggered, health was: " .. health .. "^7")
            SetEntityHealth(playerPed, 200)
            SetPedArmour(playerPed, 100)
            hasHealed = true
        end
    end
end)