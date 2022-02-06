RegisterNetEvent('core:spawnLobby', function(coords)
    exports.spawnmanager:spawnPlayer({
        x = coords.x,
        y = coords.y,
        z = coords.z,
        heading = 88.73,
        model = `a_m_m_soucent_04`, --DEFAULT MODELI TÄLLÄ HETKELLÄ
        skipFade = false
    }, function()
        print("Joined game")
        Core.Player.OnLobby = true
    end)
end)

RegisterNetEvent('core:SpawnPlayer', function(player)
    local ped = PlayerPedId()
    local p = cfg.spawn_pos

    SetMaxWantedLevel(0)
    SetPlayerHealthRechargeMultiplier(PlayerId(), 0.0)
    SetCanAttackFriendly(ped, true, false)
    NetworkSetFriendlyFireOption(true)

    exports.spawnmanager:spawnPlayer({
        x = p.x,
        y = p.y,
        z = p.z,
        heading = 88.73,
        model = `a_m_m_soucent_04`, --DEFAULT MODELI TÄLLÄ HETKELLÄ
        skipFade = false
    }, function()
        print("Spawned")
    end)
end)