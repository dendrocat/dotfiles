local function on_attach(_, bufnr)
	local opts = { buffer = bufnr }
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
end

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local lsps = { 'clangd', 'pyright', 'lua_ls', 'omnisharp' }
local configs = require("config.lsp_configs")

for _, lsp in ipairs(lsps) do
	local config = configs[lsp] or {}
	config.on_attach = on_attach
	config.capabilities = capabilities

	vim.lsp.config(lsp, config)
	vim.lsp.enable(lsp)
end

vim.api.nvim_create_user_command("LspInfo",
	function()
		vim.cmd("checkhealth vim.lsp")
		vim.cmd("LualineRenameTab lsp.info")
	end,
	{
		desc = "Checkhealth lsp",
		nargs = 0,
	})

vim.api.nvim_create_user_command("LspLog",
	function()
		vim.cmd("tabedit " .. vim.lsp.log.get_filename())
	end,
	{
		desc = "Open lsp log file",
		nargs = 0,
	})
