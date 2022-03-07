Core = {}
Core.Players = {}
Core.Functions = {}

CreateThread(function()
    Wait(1000)
    Core.Functions.LoadData(function(callback) --Lataa banlistin ja checkkaa onesyncin
        if callback then
            print("^2Kaikki ladattu onnistuneesti!^7")
                while true do
                    Wait(s_cfg.map_vote_start_timer)
                    for lobbyName, lobbyData in pairs(s_cfg.lobbys) do
                        if #lobbyData.players ~= 0 then
                            CreateThread(function()
                                Core.Functions.startMapVote({ name = lobbyName, data = lobbyData })
                                Wait(s_cfg.map_vote_timer)
                                Core.Functions.endMapVote({ name = lobbyName, data = lobbyData })
                            end)
                        end
                    end
                end
        else
            print("^1Jotakin ei voitu ladata oikein^7")
        end
    end)
end)