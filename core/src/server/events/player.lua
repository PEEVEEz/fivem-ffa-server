RegisterNetEvent('core:PlayerJoined', function()
    local license = Core.Functions.PlayerIdentifiers(source).license
    Core.Functions.LoadPlayer(--[[PlayerID:]] source, --[[License]] license)
end)

AddEventHandler('playerDropped', function (reason)
    Core.Players[source] = nil
end)

AddEventHandler('playerConnecting',function(playerName, setKickReason, deferrals)
    local _identifiers = Core.Functions.PlayerIdentifiers(source)
    print()
    deferrals.defer()
    deferrals.update("Tarkistetaan tietojasi....")
    Wait(1200)
    for _,v in pairs(cfg.banlist) do
        if v["license"] == _identifiers["license"] or v["discord"] == _identifiers["discord"] then
            deferrals.done("Sinulla on porttikielto palvelimelle. Syy: "..v.reason)
        end
    end
    deferrals.done()
end)