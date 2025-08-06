-- Simple Admin Commands - Client Side

RegisterCommand('heal', function()
    local playerPed = PlayerPedId()
    SetEntityHealth(playerPed, 200)
    SetPedArmour(playerPed, 100)
    TriggerEvent('chat:addMessage', {
        color = {0, 255, 0},
        multiline = true,
        args = {"ADMIN", "You have been healed!"}
    })
end, false)

RegisterCommand('car', function(source, args, rawCommand)
    if not args[1] then
        TriggerEvent('chat:addMessage', {
            color = {255, 0, 0},
            multiline = true,
            args = {"ERROR", "Usage: /car [vehicle_name]"}
        })
        return
    end

    local vehicle = args[1]
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    
    RequestModel(vehicle)
    local timeout = 5000
    while not HasModelLoaded(vehicle) and timeout > 0 do
        Citizen.Wait(100)
        timeout = timeout - 100
    end
    
    if HasModelLoaded(vehicle) then
        local veh = CreateVehicle(vehicle, coords.x, coords.y, coords.z, GetEntityHeading(playerPed), true, false)
        TaskWarpPedIntoVehicle(playerPed, veh, -1)
        SetModelAsNoLongerNeeded(vehicle)
        TriggerEvent('chat:addMessage', {
            color = {0, 255, 0},
            multiline = true,
            args = {"ADMIN", "Vehicle spawned: " .. vehicle}
        })
    else
        TriggerEvent('chat:addMessage', {
            color = {255, 0, 0},
            multiline = true,
            args = {"ERROR", "Invalid vehicle name: " .. vehicle}
        })
    end
end, false)

RegisterCommand('tp', function(source, args, rawCommand)
    if not args[1] or not args[2] then
        TriggerEvent('chat:addMessage', {
            color = {255, 0, 0},
            multiline = true,
            args = {"ERROR", "Usage: /tp [x] [y] [z] or /tp [x] [y]"}
        })
        return
    end

    local x = tonumber(args[1])
    local y = tonumber(args[2])
    local z = tonumber(args[3]) or 1000.0 -- Default high altitude if z not provided
    
    if x and y then
        local playerPed = PlayerPedId()
        
        -- If z wasn't provided, get ground Z coordinate
        if not args[3] then
            local groundFound, groundZ = GetGroundZFor_3dCoord(x, y, z, false)
            if groundFound then
                z = groundZ + 1.0
            else
                z = 72.0 -- Default ground level
            end
        end
        
        SetEntityCoords(playerPed, x, y, z, false, false, false, true)
        TriggerEvent('chat:addMessage', {
            color = {0, 255, 0},
            multiline = true,
            args = {"ADMIN", "Teleported to: " .. x .. ", " .. y .. ", " .. z}
        })
    else
        TriggerEvent('chat:addMessage', {
            color = {255, 0, 0},
            multiline = true,
            args = {"ERROR", "Invalid coordinates"}
        })
    end
end, false)

RegisterCommand('god', function()
    local playerPed = PlayerPedId()
    if GetPlayerInvincible(PlayerId()) then
        SetEntityInvincible(playerPed, false)
        TriggerEvent('chat:addMessage', {
            color = {255, 255, 0},
            multiline = true,
            args = {"ADMIN", "God mode OFF"}
        })
    else
        SetEntityInvincible(playerPed, true)
        TriggerEvent('chat:addMessage', {
            color = {0, 255, 0},
            multiline = true,
            args = {"ADMIN", "God mode ON"}
        })
    end
end, false)

RegisterCommand('fix', function()
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)
    
    if vehicle == 0 then
        TriggerEvent('chat:addMessage', {
            color = {255, 0, 0},
            multiline = true,
            args = {"ERROR", "You must be in a vehicle to use this command"}
        })
        return
    end
    
    SetVehicleFixed(vehicle)
    SetVehicleDeformationFixed(vehicle)
    SetVehicleUndriveable(vehicle, false)
    SetVehicleEngineOn(vehicle, true, true)
    
    TriggerEvent('chat:addMessage', {
        color = {0, 255, 0},
        multiline = true,
        args = {"ADMIN", "Vehicle repaired!"}
    })
end, false)