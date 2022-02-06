
RegisterNetEvent('core:updateData', function(lobby, data)
    if not lobby then Core.Lobbys = data
    else Core.Lobbys[lobby] = data end
    print("Data updated1")
end)

--karpo