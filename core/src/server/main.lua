Core = {}
Core.Players = {}
Core.Functions = {}

CreateThread(function()
    Wait(1000)
    Core.Functions.LoadData(function(callback)
        if callback then
            print("^2Kaikki ladattu onnistuneesti!^7")
        else
            print("^1Jotakin ei voitu ladata oikein^7")
        end
    end)
end)