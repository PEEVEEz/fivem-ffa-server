
RegisterNetEvent('core:updateData', function(lobby, data)
    print(json.encode(data))
    if not lobby then Core.Lobbys = data
    else Core.Lobbys[lobby] = data end
    print("Data updated")
end)