
RegisterNetEvent("core:cl:player:default_spawn", function(data)
    SetMaxWantedLevel(0)
    NetworkSetFriendlyFireOption(true)
	SetCanAttackFriendly(PlayerPedId(), true, false)

    local coords = c_cfg.default_spawn 
    exports.spawnmanager:spawnPlayer({
        x = coords.x,
        y = coords.y,
        z = coords.z,
        heading = coords.w,
        model = `a_m_m_soucent_04`, --DEFAULT MODELI TÄLLÄ HETKELLÄ
        skipFade = false
    }, function()
        Core.Functions.CreateBlips()
        Core.Functions.UIOpen(true)
    end)
end)

RegisterNUICallback("change_ped", function(data, cb)
    local ped = data.ped
    if not ped then return end
    --TODO: Vaihda pedi ja tallenna
end)