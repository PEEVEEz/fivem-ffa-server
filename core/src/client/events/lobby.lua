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
    SetEntityCoords(playerPed, coords.x, coords.y, coords.z)
    SetEntityHeading(playerPed, 88.73)
    Core.Player.Lobby = lobby
    Core.Functions.EnableFire(true)
end)

RegisterNetEvent('core:cl:lobby:changeArea', function(newArea)
    Core.Functions.Notify("Alue vaihdettu!")
    local playerPed = PlayerPedId()
    SetEntityCoords(playerPed, newArea.x, newArea.y, newArea.z)
end)

RegisterNetEvent('core:cl:lobby:leave', function(coords)
    if Core.Player.Lobby == "spawn" then return end
    local playerPed = PlayerPedId()
    Core.Player.removeAllWeapons()
    SetEntityCoords(playerPed, coords.x, coords.y, coords.z)
    Core.Player.Lobby = "spawn"
    Core.Functions.EnableFire(false)
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


RegisterNUICallback('vote_change_map', function(data, cb)
     local map = data.map
     if not map then cb("NT") end
     SetNuiFocus(false, false);
     print(map)
     TriggerServerEvent('core:sv:lobby:vote_map', Core.Player.Lobby, map)
end)
