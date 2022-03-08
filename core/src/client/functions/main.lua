Core.Functions.Notify = function(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(true, false)
end

Core.Functions.CreateBlips = function()
    for _,area in pairs(Core.Data.Areas) do
        local coords = area.coords
        Core.Data.Blips[area.name] = AddBlipForRadius(coords, c_cfg.area_radius + 0.0)
        SetBlipColour(Core.Data.Blips[area.name], 4)
        SetBlipAlpha(Core.Data.Blips[area.name], 50)
    end
end