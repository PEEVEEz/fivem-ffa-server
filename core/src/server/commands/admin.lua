

RegisterCommand('ban', function(source)
    local player = Core.Players[source]

    if player.isAdmin() then

    else
        print("Pelaaja ei ole admin")
    end
end)