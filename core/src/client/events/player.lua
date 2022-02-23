
RegisterNetEvent('core:cl:player:default_spawn', function(data)
    SetMaxWantedLevel(0)
    local coords = c_cfg.default_spawn 
    exports.spawnmanager:spawnPlayer({
        x = coords.x,
        y = coords.y,
        z = coords.z,
        heading = c_cfg.default_spawn_h,
        model = `a_m_m_soucent_04`, --DEFAULT MODELI TÄLLÄ HETKELLÄ
        skipFade = false
    }, function()
        Core.UI.Open(true)
    end)
end)

RegisterNUICallback("change_ped", function(data, cb)
    local ped = data.ped
    if not ped then return end
    --TODO: Vaihda pedi ja tallenna
end)