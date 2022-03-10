RegisterNetEvent("core:sv:player:joined", function()
    --TODO: Get data from database
    Core.Functions.CreatePlayer(source, GetPlayerName(source))

    SetPlayerRoutingBucket(source, "player_" .. source) --set player default lobby
    TriggerClientEvent("core:cl:lobby:update", source, nil, {Lobbys = s_cfg.lobbys, Areas = s_cfg.areas})
    TriggerClientEvent("core:cl:player:default_spawn", source)
end)

AddEventHandler("playerDropped", function(reason)
    local player = Core.Players[source]
    local identifiers = Core.Functions.GetPlayerIdentifiers(source)
    Core.Functions.Webhook(
        player.name .. " Left the server. IP: ",
        identifiers["ip"] .. "\n DC: " .. identifiers["discord"] .. " \n STEAM: " .. identifiers["steam"] .. " \n Reason: " .. reason,
        s_cfg.webhooks.leave
    )

    if player.lobby then
        s_cfg.lobbys[player.lobby].players[source] = nil
    end
    Core.Players[source] = nil
end)

AddEventHandler("playerConnecting", function(playerName, setKickReason, deferrals)
    local identifiers = Core.Functions.GetPlayerIdentifiers(source)
    deferrals.defer()
    deferrals.update("Tarkistetaan tietojasi....")
    Wait(800)

    if not identifiers["steam"] then
        return deferrals.done("Sinulla pitää olla steami auki")
    end

    Core.Functions.Webhook(
        playerName .. " Connected to the server. IP: ",
        identifiers["ip"] .. "\n DC: " .. identifiers["discord"] .. " \n STEAM: " .. identifiers["steam"],
        s_cfg.webhooks.join
    )

    for _, v in pairs(s_cfg.ban_list) do
        if v["license"] == identifiers["license"] or v["discord"] == identifiers["discord"] then
            deferrals.done("Sinulla on porttikielto palvelimelle. Syy: " .. v.reason)
        end
    end
    deferrals.done()
end)
