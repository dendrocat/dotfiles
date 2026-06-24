local tree = require("nvim-treesitter")
tree.setup({
	install_dir = vim.fs.joinpath(vim.fn.stdpath("data"), "treesitter-parsers")
})

local parsers = {
	'c', 'cpp', 'c_sharp', 'lua', 'python',
	'css', 'javascript', 'typescript',
	'gitignore', 'gitattributes',
	'json', 'xml', 'yaml',
	'regex',
	'markdown',
	'sql',
}
tree.install(parsers)

vim.api.nvim_create_autocmd('FileType', {
	callback = function(args)
		local bufnr = args.buf

		local ft = vim.bo[bufnr].filetype
		if ft == "" then return end

		local lang = vim.treesitter.language.get_lang(ft)
		if lang == nil then return end

		if vim.treesitter.language.add(lang) then
			vim.treesitter.start(bufnr, lang)
		end
	end
})
