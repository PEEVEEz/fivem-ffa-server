Core = {}
Core.Functions = {}
Core.Lobbys = {}
Core.Player = {}
Core.Player.OnLobby = true


CreateThread(function()
    while true do
        if NetworkIsPlayerActive(PlayerId()) then
			TriggerServerEvent('core:PlayerJoined')
			break
		end
    end
end)


CreateThread(function()
    TriggerServerEvent('core:getLobbys')
    Wait(600)
    while true do
        Wait(3)
        local wait = true
        if Core.Player.OnLobby then
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)
            for k,v in pairs(Core.Lobbys) do
                local distance = #(v.coords - playerCoords)
    
                if distance < 2 then
                    wait = false
                    Core.Functions.Text3D(v.coords, "[E] "..k.." | "..#v.players.."/"..cfg.max_players_lobby.." pelaajaa | "..v.alue)

                    if #v.players < cfg.max_players_lobby then
                        if IsControlJustReleased(0, 38) then
                            Core.Player.OnLobby = false
                            TriggerServerEvent('core:joinLobby', k)
                        end
                    else
                        print("Täynnä")
                    end
                end
            end
        end
        if wait then Wait(1200) end
    end
end)