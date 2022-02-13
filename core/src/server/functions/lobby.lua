
Core.Functions.startMapVote = function()
    for lobbyName, lobbyData in pairs(s_cfg.lobbys) do
        if #lobbyData.players ~= 0 then
            for playerSrc, _ in pairs(lobbyData.players) do
                TriggerClientEvent('core:cl:lobby:startVote', playerSrc, s_cfg.areas)
            end
        end
    end
end

Core.Functions.endMapVote = function()
    for lobbyName, lobbyData in pairs(s_cfg.lobbys) do
        local mostVoteCount = 0
        local nextMap = ""
        if #lobbyData.players ~= 0 then
            for mapName,voteCount in pairs(lobbyData.mapVote) do
                if voteCount >= mostVoteCount then
                    mostVoteCount = voteCount
                    nextMap = mapName
                end
            end

            local changeArea = mostVoteCount > 0 and lobbyData.area ~= nextMap
            
            if changeArea then
                s_cfg.lobbys[lobbyName].area = nextMap
            end

            for playerSrc,_ in pairs(lobbyData.players) do
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
    end
end
