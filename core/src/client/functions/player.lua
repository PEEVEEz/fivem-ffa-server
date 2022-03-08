
Core.Functions.addWeapons = function(area)
    local playerPed = PlayerPedId()
    local guns = Core.Data.Lobbys[area].guns
    for i=1, #guns do 
        GiveWeaponToPed(playerPed, guns[i], 9999)
    end
end

Core.Functions.removeAllWeapons = function()
    local playerPed = PlayerPedId()
    RemoveAllPedWeapons(playerPed)
end

Core.Functions.Teleport = function(x,y,z,h)
    local playerPed = PlayerPedId()
    SetEntityCoords(playerPed, x, y, z)
    if not h then return end
    SetEntityHeading(playerPed, h)
end

Core.Functions.SpawnCam = function(bool)
    if bool then
        local coords = c_cfg.default_spawn
        Core.Player.Camera = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", coords.x + 0.2, coords.y + 3.0, coords.z, 0.0,0.0, coords.w / 2, 50.0, false, 0)
        SetCamActive(Core.Player.Camera, true)
        RenderScriptCams(true, false, 1, true, true)
    else
        SetCamActive(Core.Player.Camera, false)
        DestroyCam(Core.Player.Camera, true)
        RenderScriptCams(false, false, 1, true, true)
    end
end