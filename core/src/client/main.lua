Core = {}
Core.Functions = {}


CreateThread(function()
    while true do
        if NetworkIsPlayerActive(PlayerId()) then
			TriggerServerEvent('core:PlayerJoined')
			break
		end
    end
end)