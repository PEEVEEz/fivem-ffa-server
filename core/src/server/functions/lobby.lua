
Core.Functions.startMapVote = function(lobby)
    print("Map vote start | Lobby: "..lobby.name)

    for playerSrc, _ in pairs(lobby.data.players) do
        TriggerClientEvent('core:cl:lobby:startVote', playerSrc, s_cfg.map_vote_timer)
    end
end

Core.Functions.endMapVote = function(lobby)
    local mostVoteCount = 0
    local nextMap = ""
    print("Map vote end | Lobby: "..lobby.name)

    for mapName,voteCount in pairs(lobby.data.mapVote) do
        if voteCount >= mostVoteCount then
            mostVoteCount = voteCount
            nextMap = mapName
        end
    end

    local changeArea = mostVoteCount > 0 and lobby.data.area ~= nextMap

    if changeArea then
        s_cfg.lobbys[lobby.name].area = nextMap
    end

    for playerSrc,_ in pairs(lobby.data.players) do
        TriggerClientEvent('core:cl:lobby:endVote', playerSrc)
        if changeArea then
            for _,mapData in pairs(s_cfg.areas) do
                if mapData.name == nextMap then
                    TriggerClientEvent('core:cl:lobby:changeArea', playerSrc, mapData.coords)
                end
            end
        end
    end
end