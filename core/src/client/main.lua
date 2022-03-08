Core = {}
Core.Functions = {}

Core.Data = {}
Core.Data.Blips = {}
Core.Data.Areas = {}
Core.Data.Lobbys = {}

Core.Player = {}
Core.Player.Camera = nil
Core.Player.onLobby = false
Core.Player.Shooting = false


CreateThread(function()
	while not NetworkIsPlayerActive(PlayerId()) do Wait(600) end
	TriggerServerEvent('core:sv:player:joined')
    while true do
        local wait = 1200
		local playerPed = PlayerPedId()
		local playerID = PlayerId()

		if Core.Player.onLobby then
			wait = 3
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
	TriggerServerEvent('core:sv:lobby:leave')
end)

RegisterCommand("die", function()
    SetEntityHealth(PlayerPedId(), 0)
end)
