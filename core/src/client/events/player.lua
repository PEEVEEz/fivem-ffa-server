RegisterNetEvent('core:SpawnPlayer')
AddEventHandler('core:SpawnPlayer', function(player)
    local ped = PlayerPedId()
    local p = cfg.lobby_pos

    SetMaxWantedLevel(0)
    SetPlayerHealthRechargeMultiplier(PlayerId(), 0.0)
    SetCanAttackFriendly(ped, true, false)
    NetworkSetFriendlyFireOption(true)

    exports.spawnmanager:spawnPlayer({
        x = p.x,
        y = p.y,
        z = p.z,
        heading = p.h,
        model = `a_m_m_soucent_04`, --DEFAULT MODELI TÄLLÄ HETKELLÄ
        skipFade = false
    }, function()
        print("Spawned")
    end)
end)