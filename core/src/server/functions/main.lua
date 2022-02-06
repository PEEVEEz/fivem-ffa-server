Core.Functions.LoadData = function(cb)
	local dataPath = "./src/data/"
	local resourceName = GetCurrentResourceName()
	local Banlist = json.decode(LoadResourceFile(resourceName, dataPath.."banlist.json"))
	local Locales = json.decode(LoadResourceFile(resourceName, dataPath.."locales.json"))


	if BanList ~= nil then
		cfg.banlist = Banlist
	else
		cfg.banlist = {}
	end


	--LOCALES
	if Locales[cfg.locale] ~= nil then
		cfg.locales = Locales[cfg.locale]
	else
		cfg.locales = Locales["fi"]
		print("[ERROR] "..cfg.locale.." does not exist")
	end

	if Banlist ~= nil or Locales ~= nil then
		cb(true)
	else
		cb(false)
	end
end