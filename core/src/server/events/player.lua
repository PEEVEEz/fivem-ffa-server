RegisterNetEvent('core:PlayerJoined')
AddEventHandler('core:PlayerJoined', function()
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
    -- local playerDC = Core.Functions.PlayerDiscordData(src)
    -- if playerDC["AL"] then
    --     if _identifiers["license"] then
    --         if #cfg.banlist == 0 then
    --             deferrals.done()
    --         else
    --             for k,v in pairs(cfg.banlist) do
    --                 if v["license"] == _identifiers["license"] or v["discord"] == _identifiers["discord"] then
    --                     deferrals.done(cfg.locales["Banned"])
    --                 else
    --                     deferrals.done()
    --                 end
    --             end
    --         end
    --     elseif not _identifiers["license"] then
    --         deferrals.done(cfg.locales["LicenseNotFound"])
    --     else
    --         deferrals.done()
    --     end
    -- else
    --     deferrals.done(cfg.locales["NOAL"])
    -- end
    deferrals.done()
end)