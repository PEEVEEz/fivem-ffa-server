
RegisterNetEvent('core:getLobbys', function()
    TriggerClientEvent('core:updateData', source, nil, s_cfg.lobbys)
end)


RegisterNetEvent('core:leaveLobby', function(lobby)
    s_cfg.lobbys[lobby].players[source] = nil
end)

RegisterNetEvent('core:joinLobby', function(lobby)
    s_cfg.lobbys[lobby].players[source] = true
    local coords = s_cfg.locations[s_cfg.lobbys[lobby].alue]
    TriggerClientEvent('core:spawnLobby', source, coords)
    TriggerClientEvent('core:updateData', -1, lobby, s_cfg.lobbys[lobby])
end)