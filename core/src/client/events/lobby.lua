RegisterNetEvent('core:cl:lobby:update', function(lobby, data)
    if not lobby then 
        Core.Data.Lobbys = data.Lobbys
        Core.Data.Areas = data.Areas
    else Core.Data.Lobbys[lobby] = data end
    print("Data updated")
end)

RegisterNetEvent('core:cl:lobby:join', function(lobby, coords)
    local playerPed = PlayerPedId()
    Core.Player.addWeapons(lobby)
    Core.Player.SpawnCam(false)
    Core.Player.SetCoords(coords.x, coords.y, coords.z, 88.73)
    Core.UI.Open(false)
    Core.Player.onLobby = true
end)

RegisterNetEvent('core:cl:lobby:changeArea', function(newArea)
    Core.Functions.Notify("Alue vaihdettu!")
    Core.Player.SetCoords(newArea.x, newArea.y, newArea.z, 88.73)
end)

RegisterNetEvent('core:cl:lobby:leave', function()
    if not Core.Player.onLobby then return end
    Core.Player.removeAllWeapons()
    Core.Player.onLobby = false
    TriggerEvent('core:cl:player:default_spawn')
end)

RegisterNetEvent('core:cl:lobby:startVote', function(maps)
	SetNuiFocus(true, false);
	SendNuiMessage(json.encode({
		action = "map_vote",
		data = {
			on = true,
			maps = maps
		}
	}))
end)

RegisterNetEvent('core:cl:lobby:endVote', function()
	SetNuiFocus(false, false);
	SendNuiMessage(json.encode({
		action = "map_vote",
		data = {
			on = false,
			maps = {}
		}
	}))
end)

RegisterNUICallback("join_lobby", function(data, cb)
    local lobby = data.lobby
    if lobby then
        TriggerServerEvent('core:sv:lobby:join', lobby)
    end
end)


RegisterNUICallback('vote_change_map', function(data, cb)
     local map = data.map
     if not map then cb("NT") end
     SetNuiFocus(false, false);
     TriggerServerEvent('core:sv:lobby:vote_map', map)
end)
