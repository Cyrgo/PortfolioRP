local QBCore = exports['qb-core']:GetCoreObject()

-- Auto-heal players on spawn
RegisterNetEvent('QBCore:Server:OnPlayerLoaded', function()
    local src = source
    Wait(3000) -- Wait for character to fully load
    
    -- Force heal the player
    TriggerClientEvent('hospital:client:Revive', src)
    print("^2[AutoHeal] Player " .. src .. " auto-healed on spawn^7")
end)