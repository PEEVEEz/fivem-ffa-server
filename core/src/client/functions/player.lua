

Core.Player.addWeapons = function(area)
    local playerPed = PlayerPedId()
    local guns = Core.Data.Lobbys[area].guns
    for i=1, #guns do 
        GiveWeaponToPed(playerPed, guns[i], 9999)
    end
end

Core.Player.removeAllWeapons = function()
    local playerPed = PlayerPedId()
    RemoveAllPedWeapons(playerPed)
end

Core.Functions.EnableFire = function(bool)
    SetCanAttackFriendly(playerPed, bool, false)
    NetworkSetFriendlyFireOption(bool)
end