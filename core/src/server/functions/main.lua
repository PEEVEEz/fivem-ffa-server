Core.Functions.LoadData = function(cb)
	local dataPath = "./src/data/"
	local resourceName = GetCurrentResourceName()
	local Banlist = json.decode(LoadResourceFile(resourceName, dataPath.."banlist.json"))

	if BanList ~= nil then
		cfg.banlist = Banlist
	end

	if Banlist ~= nil then
		cb(true)
	else
		cb(false)
	end
end