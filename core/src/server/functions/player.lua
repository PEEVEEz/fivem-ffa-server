Core.Functions.GetPlayerIdentifiers = function (id)
    local identifiers = {}
    local GetPlayerIdentifiers = GetPlayerIdentifiers(id)
    for _,identifier in pairs(GetPlayerIdentifiers) do
        local split = Shared.Function.Split(identifier, ":")
        if identifier ~= nil then
            identifiers[split[1]] = split[2]
        end
    end
    return identifiers
end

Core.Functions.CreatePlayer = function(src, playerName)
    local player = {}

    player.source = src
    player.name = playerName
    player.lobby = nil

    player.isAdmin = function()
        local admins = s_cfg.admins
        local playerIdentifiers = Core.Functions.GetPlayerIdentifiers(player.source)

        if #admins ~= 0 then
            for k,v in pairs(admins) do
                if playerIdentifiers["license"] == v["license"] then
                    return true
                end
            end
        end

        return false
    end

    if not Core.Players[src] then
        Core.Players[src] = player
    end

    return player
end