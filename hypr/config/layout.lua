-- Layout
hl.config({
	general = {
		layout        = "scrolling",

		gaps_out      = 7,
		gaps_in       = 5,

		border_size   = 2,
		allow_tearing = false,
	},
})

-- Decorations
hl.config({
	decoration = {
		rounding           = 10,
		active_opacity     = 1.0,
		inactive_opacity   = 0.9,
		fullscreen_opacity = 1.0,
		rounding_power     = 2,

		shadow             = {
			enabled      = true,
			range        = 32,
			render_power = 2,
			color        = "rgba(00000050)",
		},

		blur               = {
			enabled           = true,
			size              = 4,
			passes            = 4,
			new_optimizations = true,
			ignore_opacity    = true,
			xray              = true,
			vibrancy          = 0.1696,
		},
	},
})

-- Misc
hl.config({
	misc = {
		disable_hyprland_logo      = true,
		force_default_wallpaper    = 0,
		disable_splash_rendering   = true,
		initial_workspace_tracking = 1,
		on_focus_under_fullscreen  = 1,
		allow_session_lock_restore = true,
	}
})
