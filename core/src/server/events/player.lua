RegisterNetEvent('core:sv:player:joined', function()
    local src = source
    local playerName = GetPlayerName(src)
    local playerIdentifiers = Core.Functions.GetPlayerIdentifiers(src)
    Core.Players[src] = {
        source = src,
        name = playerName,
        identifiers = playerIdentifiers,
        lobby = nil
    }

    SetPlayerRoutingBucket(src, "player_"..source) --set player default lobby
    TriggerClientEvent('core:cl:lobby:update', src, nil, { Lobbys = s_cfg.lobbys, Areas = s_cfg.areas })
    TriggerClientEvent('core:cl:player:default_spawn', src)
end)

AddEventHandler('playerDropped', function(reason)
    local player = Core.Players[source]
    local i = player.identifiers
    Core.Functions.Webhook(player.name .. " Left the server. IP: ",i["ip"].."\n DC: "..i["discord"].." \n STEAM: "..i["steam"].." \n Reason: "..reason, s_cfg.webhooks.leave)
    
    local playerLobby = Core.Players[source].lobby
    if playerLobby then 
        s_cfg.lobbys[playerLobby].players[source] = nil
    end
    Core.Players[source] = nil
end)

AddEventHandler('playerConnecting',function(playerName, setKickReason, deferrals)
    local i = Core.Functions.GetPlayerIdentifiers(source)
    deferrals.defer()
    deferrals.update("Tarkistetaan tietojasi....")
    Wait(800)
    
    if not i["steam"] then
        return deferrals.done("Sinulla pitää olla steami auki")
    end

    Core.Functions.Webhook(playerName.. " Connected to the server. IP: ", i["ip"].."\n DC: "..i["discord"].." \n STEAM: "..i["steam"], s_cfg.webhooks.join)
    
    for _,v in pairs(s_cfg.ban_list) do
        if v["license"] == i["license"] or v["discord"] == i["discord"] then
            deferrals.done("Sinulla on porttikielto palvelimelle. Syy: "..v.reason)
        end
    end
    deferrals.done()
end)
