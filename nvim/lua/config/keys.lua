-- Terminal
vim.keymap.set('n', '<leader>t', ':tabnew<CR>:terminal<CR>i', { desc = 'Open terminal' })
vim.keymap.set('t', '<C-n>', "<C-\\><C-n>", { desc = 'Exit terminal' })
vim.keymap.set('t', '<Esc>', "<C-\\><C-n>", { desc = 'Exit terminal' })


-- Diagnostic
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Show diagnostic' })

local jump = function(cnt) vim.diagnostic.jump({ count = cnt, float = true }) end
vim.keymap.set('n', '[d', function() jump(-1) end, { desc = 'Prev diagnostic' })
vim.keymap.set('n', ']d', function() jump(1) end, { desc = 'Next diagnostic' })


-- Settings
vim.keymap.set('n', '<leader>s', ':e $MYVIMRC | cd %:p:h | wincmd k | pwd<CR>', { desc = "Open settings" })

vim.keymap.set('n', '<leader>bd', function()
	local bufs = vim.api.nvim_list_bufs()
	-- Check for modified buffers
	for _, buf in ipairs(bufs) do
		if vim.api.nvim_buf_is_valid(buf)
			and vim.api.nvim_get_option_value('modified', { buf = buf })
			and vim.api.nvim_get_option_value('buflisted', { buf = buf }) then
			vim.notify("Found modified buffers. Save or discard changes before clearing buffers", vim.log.levels.ERROR)
			return
		end
	end

	vim.cmd [[NvimTreeClose]]

	local cur_buf = vim.api.nvim_get_current_buf()
	for _, buf in ipairs(bufs) do
		if buf ~= cur_buf then
			pcall(vim.api.nvim_buf_delete, buf, { force = true })
		end
	end

	vim.cmd [[NvimTreeFocus]]
	vim.cmd [[wincmd p]]
end, { desc = "Buffer: all delete", noremap = true, silent = true })
