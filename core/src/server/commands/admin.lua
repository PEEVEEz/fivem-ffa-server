

Core.Functions.RegisterCommand("ban", true, function(source, args)
    local playerID = tonumber(args[1])
    local player = Core.Players[playerID]
    if player then
        player.ban()
    else
        print("Pelaajaa ei löytynyt")
    end
end)