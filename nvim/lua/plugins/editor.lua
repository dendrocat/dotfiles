return {
	-- Autopairs
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		config = true
	},

	-- Formatter
	{ 'stevearc/conform.nvim', },

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		branch = 'main',
		commit = '4916d65',
		lazy = false,
		build = ":TSUpdate",
	},
}
