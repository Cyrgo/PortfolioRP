-- Simple Admin Commands - Server Side

-- Restrict admin commands to admin group only
local adminCommands = {
    'heal', 'car', 'tp', 'god', 'fix'
}

for _, command in pairs(adminCommands) do
    RegisterCommand(command, function(source, args, rawCommand)
        -- This will only execute if player has permission
        -- Actual command logic is on client side
    end, true) -- true = restricted command
end

-- Give admin commands permission to admin group
for _, command in pairs(adminCommands) do
    ExecuteCommand('add_ace group.admin command.' .. command .. ' allow')
end

-- Notify when resource starts
AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    print('Simple Admin Commands loaded!')
    print('Available commands: /heal, /car [vehicle], /tp [x] [y] [z], /god, /fix')
    print('Note: These commands require admin permissions')
end)