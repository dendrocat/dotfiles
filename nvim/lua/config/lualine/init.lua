package.path = vim.fn.stdpath("config") .. "/lua/config/lualine/?.lua;" .. package.path

local lspactive = require("lspactive")
local file = require("file")
local align = "%="

local function hide_in_width(width)
	return function() return vim.fn.winwidth(0) > width end
end

local config = {}
config.options = {
	section_separators = { left = "", right = "" },
	-- section_separators = { left = "", right = "" },
	component_separators = ""
}
config.sections = {
	lualine_a = { "mode" },
	lualine_b = { file.flags.modified, file.flags.readonly, { "filename", file_status = false, } },
	lualine_c = { "diagnostics", align, file.icon, lspactive },
	lualine_x = {
		{ "encoding",   cond = hide_in_width(55), color = { gui = "bold" }, fmt = string.upper },
		{ "fileformat", cond = hide_in_width(55) },
	},
	lualine_y = {
		{ "diff", cond = hide_in_width(90) },
		{ "branch", icon = { "", align = "right" }, cond = hide_in_width(90) },
	},
	lualine_z = { { "location", cond = hide_in_width(65), }, "progress" },
}
config.inactive_sections = {
	lualine_a = {},
	lualine_b = {},
	lualine_c = { file.flags.modified_inactive, file.flags.readonly, { "filename", file_status = false, } },
	lualine_x = config.sections.lualine_x,
	lualine_y = {},
	lualine_z = {},
}
config.tabline = {
	lualine_a = { { "tabs", mode = 1 }, },
}
config.extensions = {
	"nvim-tree", "mason", "lazy"
}
require("lualine").setup(config)
