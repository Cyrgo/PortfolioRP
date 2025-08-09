-- Fix instant death on spawn
local spawned = false

CreateThread(function()
    -- Wait for player to be active
    while not NetworkIsPlayerActive(PlayerId()) do
        Wait(0)
    end
    
    -- Wait a bit more for everything to load
    Wait(5000)
    
    if not spawned then
        local playerPed = PlayerPedId()
        
        -- Set player to safe location
        SetEntityCoords(playerPed, -1042.0, -2745.0, 21.35, false, false, false, true)
        
        -- Make sure player is alive and healthy
        SetEntityHealth(playerPed, 200)
        SetPedArmour(playerPed, 100)
        
        -- Set player as invincible temporarily
        SetEntityInvincible(playerPed, true)
        
        -- Remove invincibility after 10 seconds
        SetTimeout(10000, function()
            SetEntityInvincible(playerPed, false)
        end)
        
        spawned = true
        print("^2[FixSpawn] Player spawned safely and healed^7")
    end
end)

-- Handle respawn after death
AddEventHandler('onClientGameTypeStart', function()
    -- Disable auto-spawn and handle manually
    exports.spawnmanager:setAutoSpawn(false)
    exports.spawnmanager:forceRespawn()
end)