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