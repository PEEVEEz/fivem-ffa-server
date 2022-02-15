Core = {}
Core.Functions = {}

Core.Data = {}
Core.Data.Areas = {}
Core.Data.Lobbys = {}

Core.Player = {}
Core.Player.Lobby = "spawn"
Core.Player.Shooting = false


CreateThread(function()
	while true do
        if NetworkIsPlayerActive(PlayerId()) then
			TriggerServerEvent('core:sv:player:joined')
			break
		end
    end

    while not #Core.Data.Lobbys do Wait(600) end
    while true do
        local wait = 1200
		local playerPed = PlayerPedId()
		local playerID = PlayerId()
        if Core.Player.Lobby == "spawn" then
            local playerCoords = GetEntityCoords(playerPed)
            for k,v in pairs(Core.Data.Lobbys) do
                local distance = #(v.coords - playerCoords)
    
                if distance < 2 then
                    wait = 3
                    Core.Functions.Text3D(v.coords, "~g~[E]~s~ "..k.." | "..#v.players.."/"..c_cfg.max_players_lobby.." pelaajaa | "..v.area)

					if IsControlJustReleased(0, 38) then
						if #v.players < c_cfg.max_players_lobby then
							TriggerServerEvent('core:sv:lobby:join', k)
						else
							Core.Functions.Notify("Areena on täynnä!")
						end
					end
                end
            end
		else
			wait = 3

            if IsPedDeadOrDying(playerPed) then
                print('dead')
                break
            end

			--FIRSTPERSON SHOOTING
			if not Core.Player.Shooting then wait = 100 end
			if (IsPedShooting(playerPed) or IsPlayerFreeAiming(playerID)) and GetFollowPedCamViewMode() ~= 4 then
				SetFollowPedCamViewMode(4)
				Core.Player.Shooting = true
			end
			if Core.Player.Shooting then
				HideHudComponentThisFrame(14) -- hide crosshair
				if GetFollowPedCamViewMode() == 4 and not IsPedShooting(playerPed) and not IsPlayerFreeAiming(playerID) then
					SetFollowPedCamViewMode(1)
					Core.Player.Shooting = false
				end
			end
        end
		Wait(wait)
    end
end)

RegisterCommand('leave', function()
	TriggerServerEvent('core:sv:lobby:leave', Core.Player.Lobby)
end)

RegisterCommand("die", function()
    SetEntityHealth(PlayerPedId(), 0)
end)
