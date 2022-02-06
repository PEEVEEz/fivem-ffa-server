Core.Functions.PlayerIdentifiers = function (id)
    local identifiers = {}
    local playerIdentifiers = GetPlayerIdentifiers(id)
    for _,identifier in pairs(playerIdentifiers) do
        local split = Shared.Function.Split(identifier, ":")
        if identifier ~= nil then
            identifiers[split[1]] = identifier
        end
    end
    return identifiers
end

Core.Functions.GetPlayer = function(id)
    return Core.Players[id]
end

Core.Functions.LoadPlayer = function(pID, license)
    local playerName = GetPlayerName(pID)

    local player = {
        source = pID,
        license = license,
        playerName = playerName,
    }

    Core.Players[pID] = player

    TriggerClientEvent('core:SpawnPlayer', pID)
end