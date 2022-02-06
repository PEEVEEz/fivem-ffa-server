print("Loaded")
s_cfg = {}

s_cfg.locations = {
    ["grove street"] = vector3(101.54, -1871.81, 24.16),
    ["satama"] = vector3(1195.57, -3011.05, 5.9),
    ["pohjonen"] = vector3(-203.28, 6298.44, 31.49)
}

s_cfg.lobbys = {
    ["Pistooli"] = {
        coords = vector3(1633.18, 2604.81, 45.46),
        alue = "grove street",
        players = {},
    },
    ["Smg"] = {
        coords = vector3(1633.18, 2598.62, 45.46),
        alue = "satama",
        players = {},
    },
    ["Other"] = {
        coords = vector3(1633.18, 2592.51, 45.46),
        alue = "pohjonen",
        players = {},
    }
}