
RegisterNetEvent('core:sv:lobby:join', function(lobby)
    s_cfg.lobbys[lobby].players[source] = true
    for _, mapData in pairs(s_cfg.areas) do
        if mapData.name == s_cfg.lobbys[lobby].area then
            TriggerClientEvent('core:cl:lobby:join', source, lobby, mapData.coords)
        end
    end
    TriggerClientEvent('core:cl:lobby:update', -1, lobby, s_cfg.lobbys[lobby])
    SetPlayerRoutingBucket(source, s_cfg.lobbys[lobby].routingID) 
    Core.Players[source].lobby = lobby
end)

RegisterNetEvent('core:sv:lobby:leave', function(lobby)
    s_cfg.lobbys[lobby].players[source] = nil
    SetPlayerRoutingBucket(source, 0)
    TriggerClientEvent('core:cl:lobby:leave', source, s_cfg.default_spawn)
    TriggerClientEvent('core:cl:lobby:update', -1, lobby, s_cfg.lobbys[lobby])
    Core.Players[source].lobby = nil
end)

RegisterNetEvent('core:sv:lobby:vote_map', function(lobby, map)
    local curretVoteData = s_cfg.lobbys[lobby].mapVote[map]
    if curretVoteData then
        s_cfg.lobbys[lobby].mapVote[map] = curretVoteData + 1
    else
        s_cfg.lobbys[lobby].mapVote[map] = 1
    end
end)