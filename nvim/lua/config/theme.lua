local cat = require('catppuccin')
local palet = require("catppuccin.palettes").get_palette("macchiato")

local config = {}
config.auto_integrations = true

config.styles = {
	comments = { "italic" },
	conditionals = { "italic" },
	loops = { "italic" },
	functions = { "italic" },
	keywords = { "italic" },
	strings = {},
	variables = {},
	numbers = {},
	booleans = { "italic" },
	properties = {},
	types = {},
	operators = {},
}

config.custom_highlights = {
	Type = { fg = palet.green, },
	Function = { fg = "#10b1fe", }
}

cat.setup(config)

vim.cmd("colorscheme catppuccin-macchiato")
