RegisterNetEvent('core:PlayerJoined', function()
    local src = source
    local license = Core.Functions.PlayerIdentifiers(src).license
    Core.Functions.LoadPlayer(--[[PlayerID:]] src, --[[License]] license)
end)

AddEventHandler('playerDropped', function (reason)
    local src = source
    Core.Players[src] = nil
end)

AddEventHandler('playerConnecting',function(playerName, setKickReason, deferrals)
    local src = source
    local _identifiers = Core.Functions.PlayerIdentifiers(src)
    print()
    deferrals.defer()
    deferrals.update("Tarkistetaan tietojasi....")
    Wait(1200)
    for k,v in pairs(cfg.banlist) do
        if v["license"] == _identifiers["license"] or v["discord"] == _identifiers["discord"] then
            deferrals.done("Sinulla on porttikielto palvelimelle. Syy: "..v.reason)
        end
    end
    deferrals.done()
end)