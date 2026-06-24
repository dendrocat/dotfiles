vim.g.vsnip_snippet_dir = vim.fn.stdpath('config') .. "/vsnip"

local util = require("config.util")

local filetypes = {
	cs = { "charp" },
	cpp = { "cpp" }
}

if util.is_unity_project() then
	table.insert(filetypes.cs, "charp_unity")
end

vim.g.vsnip_filetypes = filetypes
