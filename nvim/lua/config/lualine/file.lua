local file = {}

local function get_icon_comp()
	local icon_color
	return {
		function()
			local name = vim.api.nvim_buf_get_name(0)
			local ext = vim.fn.fnamemodify(name, ":e")
			local icon, color = require("nvim-web-devicons").get_icon_color(name, ext, { default = true })
			icon_color = color
			return icon
		end,
		color = function()
			return { fg = icon_color }
		end,
		cond = function()
			return next(vim.lsp.get_clients({ bufnr = vim.api.nvim_get_current_buf() })) ~= nil
		end
	}
end
file.icon = get_icon_comp()

file.flags = {}
file.flags.readonly = {
	function() return "" end,
	color = { fg = "orange" },
	cond = function() return vim.bo.readonly or not vim.bo.modifiable end,
}
file.flags.modified = {
	function() return "[+]" end,
	color = "lualine_b_insert",
	cond = function() return vim.bo.modified end,
}
file.flags.modified_inactive = {
	function() return "[+]" end,
	color = "lualine_y_diff_added_inactive",
	cond = function() return vim.bo.modified end,
}
return file
