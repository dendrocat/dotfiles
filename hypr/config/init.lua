require("config.monitors")
require("config.keys")
require("config.input")

require("config.layout")
require("config.animations")
require("config.windowrules")

-- Misc
hl.config({
	misc = {
		disable_hyprland_logo      = true,
		force_default_wallpaper    = 0,
		disable_splash_rendering   = true,
		initial_workspace_tracking = 1,
		on_focus_under_fullscreen  = 1,
		allow_session_lock_restore = true,

		middle_click_paste         = false,
	}
})
