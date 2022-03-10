Core.Functions.LoadData = function(cb)
	local dataPath = "./src/data/"
	local resourceName = GetCurrentResourceName()
	local Banlist = json.decode(LoadResourceFile(resourceName, dataPath.."banlist.json"))
	local Admins = json.decode(LoadResourceFile(resourceName, dataPath.."admins.json"))
	local OneSync = GetConvar("onesync_enabled", false) == "true"
	
	if Banlist and Admins and OneSync then
		s_cfg.ban_list = Banlist
		s_cfg.admins = Admins
		cb(true)
	else
		cb(false)
	end
end

Core.Functions.RegisterCommand = function(name, adminCommand, cb)
	RegisterCommand(name, function(source, args)
		if adminCommand and not ((Core.Players[source] ~= nil and Core.Players[source].isAdmin()) == true or source <= 0) then
			print("Pelaaja ei ole admin")
			return
		end

		cb(source, args)
	end)
end

Core.Functions.Webhook = function(name, message, hook)
	if hook:len() == 0 then return print("^1[ERROR]^7 Webhookkia ei löytynyt") end
	local embeds = {  
		{ 
			["color"] = 14690923, 
			["title"] = "**".. name .."**", 
			["description"] = message, 
			["footer"] = { 
				["text"] = os.date("%d.%m.%Y KLO: %X"), 
			}, 
		}
	}
	PerformHttpRequest(hook, function(err, text, headers) end, "POST", json.encode({username = "FFA", embeds = embeds}), { ["Content-Type"] = "application/json" })
end