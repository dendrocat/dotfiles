-- Layout
hl.config({
	general = {
		layout        = "scrolling",

		gaps_out      = 5,
		gaps_in       = 2,

		border_size   = 2,
		allow_tearing = false,

		col           = {
			active_border   = PrimaryContainer,
			inactive_border = SurfaceContainerHighest,
		}
	},
})

-- Decorations
hl.config({
	decoration = {
		rounding       = 5,
		rounding_power = 2,

		shadow         = {
			enabled = false,
		},

		blur           = {
			enabled = false,
		},
	},
})
