local gitsigns = require('gitsigns')

local config = {}

local signs = {
	add          = { text = '+' },
	change       = { text = '~' },
	delete       = { text = '_' },
	topdelete    = { text = '‾' },
	changedelete = { text = '~' },
	untracked    = { text = '┆' },
}

config.signs = signs
config.signs_staged = signs
config.signs_staged_enable = true
config.watch_gitdir = {
	follow_files = true
}
config.auto_attach = true
config.attach_to_untracked = false
config.current_line_blame_opts = {
	virt_text = true,
	virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
	delay = 1000,
	ignore_whitespace = false,
	virt_text_priority = 100,
	use_focus = true,
}
config.current_line_blame_formatter = '<author> • <author_time:%H:%M %m.%d.%Y> • <summary>'

config.signcolumn = true
config.current_line_blame = false

gitsigns.setup(config)


local function toggle_gitsigns()
	gitsigns.toggle_signs()
	gitsigns.toggle_current_line_blame()
end

vim.keymap.set('n', '<leader>ge', toggle_gitsigns, { desc = "Toggle gitsigns" })
vim.keymap.set('n', '<leader>gs', gitsigns.toggle_signs, { desc = "Toggle sign column" })
vim.keymap.set('n', '<leader>gb', gitsigns.toggle_current_line_blame, { desc = "Toggle blame" })

vim.cmd('highlight GitSignsAdd guifg=#74be74')
vim.cmd('highlight GitSignsChange guifg=#ebc170')
vim.cmd('highlight GitSignsDelete guifg=#ff4772')

