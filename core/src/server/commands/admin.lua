

RegisterCommand("ban", function(source, args)
    if (Core.Players[source] ~= nil and Core.Players[source].isAdmin()) == true or source <= 0 then
        local playerID = tonumber(args[1])
        local player = Core.Players[playerID]
        if player then
            player.ban()
        else
            print("Pelaajaa ei löytynyt")
        end
    else
        print("Pelaaja ei ole admin")
    end
end)