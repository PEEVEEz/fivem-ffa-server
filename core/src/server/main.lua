Core = {}
Core.Players = {}
Core.Functions = {}

CreateThread(function()
    Wait(1000)
    Core.Functions.LoadData(function(callback) --Lataa banlistin ja checkkaa onesyncin
        if callback then
            print("^2Kaikki ladattu onnistuneesti!^7")
        else
            print("^1Jotakin ei voitu ladata oikein^7")
        end
    end)

    while true do
        Wait(s_cfg.mapchangetime * 60000)
        if #Core.Players ~= 0 then --Ei pyöri turhaa serverillä jos ei oo pelaajia
            print("Map vote start")
            Core.Functions.startMapVote()
            Wait(1 * 60000) --1 min
            Core.Functions.endMapVote()
            print("Map vote end")
        end
    end
end)
