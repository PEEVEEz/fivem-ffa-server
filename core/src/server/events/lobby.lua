
RegisterNetEvent('core:sv:lobby:join', function(lobby) --Triggeraa tää sittenki joku haluaa joinata
    s_cfg.lobbys[lobby].players[source] = true
    local coords = Core.Functions.getArea(lobby).coords
    TriggerClientEvent('core:cl:lobby:join', source, lobby, coords)
    TriggerClientEvent('core:cl:lobby:update', -1, lobby, s_cfg.lobbys[lobby])
    SetPlayerRoutingBucket(source, s_cfg.lobbys[lobby].routingID) 
    Core.Players[source].lobby = lobby
end)

RegisterNetEvent('core:sv:lobby:leave', function()
    local playerLobby = Core.Players[source].lobby
    s_cfg.lobbys[playerLobby].players[source] = nil
    SetPlayerRoutingBucket(source, "player_"..source)
    TriggerClientEvent('core:cl:lobby:endVote', source)
    TriggerClientEvent('core:cl:lobby:update', -1, playerLobby, s_cfg.lobbys[playerLobby])
    TriggerClientEvent('core:cl:lobby:leave', source)
    Core.Players[source].lobby = nil
end)

RegisterNetEvent('core:sv:lobby:vote_map', function(map)
    local playerLobby = Core.Players[source].lobby
    local curretVoteData = s_cfg.lobbys[playerLobby].mapVote[map]
    if curretVoteData == nil then curretVoteData = 0 end
    s_cfg.lobbys[playerLobby].mapVote[map] = curretVoteData + 1
end)