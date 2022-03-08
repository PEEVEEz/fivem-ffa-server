Core.Functions.UIOpen = function(bool)
    Core.Functions.SpawnCam(bool)
    SetNuiFocus(bool, bool);
    SendNuiMessage(json.encode({
		action = "show_ui",
        show = bool,
        data = {
            lobbys = Core.Data.Lobbys,
            peds = c_cfg.peds
        }
	}))
end