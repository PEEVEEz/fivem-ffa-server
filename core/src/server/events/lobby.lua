
RegisterNetEvent('core:getLobbys', function()
    TriggerClientEvent('core:updateData', source, nil, s_cfg.lobbys)
end)

RegisterNetEvent('core:joinLobby', function(lobby)
    s_cfg.lobbys[lobby].players[source] = true
    local coords = vector3(1633.18, 2592.51, 45.46)
    TriggerClientEvent('core:spawnLobby', source, coords)
    TriggerClientEvent('core:updateData', -1, lobby, s_cfg.lobbys[lobby])
end)