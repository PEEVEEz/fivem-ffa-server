Core.Functions.Text3D = function (coords, text)
	SetTextScale(0.37, 0.37)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(coords.x,coords.y,coords.z, 0)
    DrawText(0.0, 0.0)
    DrawRect(0.0, 0.0 + 0.0125, 0.017 + (string.len(text)) / 370, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

Core.Functions.Notify = function(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(true, false)
end
