Core.UI.Open = function(bool)
    Core.Player.SpawnCam(bool)
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