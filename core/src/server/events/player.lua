RegisterNetEvent('core:PlayerJoined', function()
    local src = source
    local license = Core.Functions.PlayerIdentifiers(src).license
    Core.Functions.LoadPlayer(--[[PlayerID:]] src, --[[License]] license)
end)

AddEventHandler('playerDropped', function (reason)
    local src = source
    Core.Players[src] = nil
end)

-- AddEventHandler('playerConnecting',function(playerName, setKickReason, deferrals)
--     local src = source
--     local _identifiers = Core.Functions.PlayerIdentifiers(src)
--     print()
--     deferrals.defer()
--     deferrals.update("Tarkistetaan tietojasi....")
--     Wait(1200)
--     deferrals.done()
-- end)