s_cfg = {}

s_cfg.admins = {}
s_cfg.ban_list = {}

s_cfg.webhooks = {
    join = "",
    leave = ""
}

s_cfg.map_vote_start_timer = 10 * 60000
s_cfg.map_vote_timer = 1 * 60000

s_cfg.areas = {
    { name = "grove street", coords = vector3(101.54, -1871.81, 24.16) },
    { name = "satama", coords = vector3(981.15, -3079.71, 5.9) },
    { name = "pohjonen", coords = vector3(-203.28, 6298.44, 31.49) }
}

s_cfg.lobbys = {
    ["Pistol"] = {
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
    ["Assault Rifle"] = {
        area = "pohjonen",
        players = {},
        routingID = 3,
        mapVote = {},
        guns = {
            `WEAPON_ASSAULTRIFLE`,
            `WEAPON_CARBINERIFLE`
        }
    },
    ["Shotgun"] = {
        area = "pohjonen",
        players = {},
        routingID = 3,
        mapVote = {},
        guns = {
            `weapon_pumpshotgun`,
            `weapon_musket`,
            `weapon_combatshotgun`
        }
    }
}
