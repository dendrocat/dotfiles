-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local config = {}
config.sort = { sorter = "case_sensitive" }
config.view = {
	width = 30,
	side = 'left',
}
config.renderer = {
	group_empty = true,
	highlight_git = true,
}
config.filters = {
	dotfiles = false,
	git_ignored = false,
}
config.filters.custom = {
	"^\\.git$",
}
config.sync_root_with_cwd = true
config.git = {
	timeout = 1000,
}

local util = require("config.util")
if util.is_unity_project() then
	local unity_ignore = require("config.tree_ingores.unity")
	for _, pattern in ipairs(unity_ignore.patterns) do
		table.insert(config.filters.custom, pattern)
	end
end

require('nvim-tree').setup(config)

local api = require("nvim-tree.api")
vim.keymap.set('n', '<leader>e', function()
	if api.tree.is_visible() then
		if vim.bo.filetype == "NvimTree" then
			api.tree.close()
		else
			api.tree.focus()
		end
	else
		api.tree.open()
	end
end, { desc = 'Tree toggle' })

local function open_tree()
	api.tree.open()
	if vim.fn.argc() > 0 then
		vim.cmd [[wincmd p]]
	end
end
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_tree })

vim.cmd('highlight NvimTreeGitNew guifg=#74be74')
vim.cmd('highlight NvimTreeGitDirty guifg=#ebc170')
vim.cmd('highlight NvimTreeGitDeleted guifg=#ff033e')
