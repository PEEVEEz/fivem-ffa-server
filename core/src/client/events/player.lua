
RegisterNetEvent('core:cl:player:spawn', function(coords)
    SetMaxWantedLevel(0)
    SetPlayerHealthRechargeMultiplier(PlayerId(), 0.0)

    exports.spawnmanager:spawnPlayer({
        x = coords.x,
        y = coords.y,
        z = coords.z,
        heading = 88.73,
        model = `a_m_m_soucent_04`, --DEFAULT MODELI TÄLLÄ HETKELLÄ
        skipFade = false
    }, function()
        print("Spawned")
    end)
end)