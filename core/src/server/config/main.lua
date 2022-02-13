s_cfg = {}

s_cfg.ban_list = {}

s_cfg.webhooks = {
    join = "",
    leave = "",
    mapchanges = "" 
}

s_cfg.mapchangetime = 0.5 --minutes

s_cfg.areas = {
    { name = "grove street", coords = vector3(101.54, -1871.81, 24.16) },
    { name = "satama", coords = vector3(1195.57, -3011.05, 5.9) },
    { name = "pohjonen", coords = vector3(-203.28, 6298.44, 31.49) }
}

s_cfg.default_spawn = vector3(1647.96, 2600.29, 45.56) --Routing ID = 0

s_cfg.lobbys = {
    ["Pistooli"] = {
        coords = vector3(1633.18, 2604.81, 45.46),
        area = "grove street",
        players = {},
        routingID = 1,
        mapVote = {},
        guns = {
            `WEAPON_PISTOL_MK2`,
            `WEAPON_VINTAGEPISTOL`,
            `WEAPON_PISTOL`,
            `WEAPON_PISTOL50`
        }
    },
    ["Smg"] = {
        coords = vector3(1633.18, 2598.62, 45.46),
        area = "satama",
        players = {},
        routingID = 2,
        mapVote = {},
        guns = {
            `WEAPON_SMG`,
            `WEAPON_MICROSMG`,
            `WEAPON_COMBATPDW`
        }
    },
    ["Assault Rifles"] = {
        coords = vector3(1633.18, 2592.51, 45.46),
        area = "pohjonen",
        players = {},
        routingID = 3,
        mapVote = {},
        guns = {
            `WEAPON_ASSAULTRIFLE`,
            `WEAPON_CARBINERIFLE`
        }
    }
}
