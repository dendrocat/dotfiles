local config = {}
config.ui = {
	icons = {
		package_installed = "✓",
		package_pending = "➜",
		package_uninstalled = "✗"
	}
}
config.ensure_installed = {
	"clangd", "clang-format",
	"pyright", "black",
	"lua-language-server",
	-- "omnisharp",
	"prettier",
	"xmlformatter",
}
require("mason").setup(config)


vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		local ok_reg, reg = pcall(require, "mason-registry")
		if not ok_reg then
			vim.notify("Mason is not installed", vim.log.levels.ERROR)
			return
		end
		reg.refresh(function()
			for _, pack_name in ipairs(config.ensure_installed) do
				local pack = reg.get_package(pack_name)
				if not pack:is_installed() then
					vim.notify(("%s is installing..."):format(pack_name), vim.log.levels.INFO)
					pack:install({}, function(ok_pack)
						vim.schedule(function()
							if ok_pack then
								vim.notify(("%s was successfully installed."):format(pack_name), vim.log.levels.INFO)
							else
								vim.notify(("%s failed to install."):format(pack_name), vim.log.levels.ERROR)
							end
						end)
					end)
				end
			end
		end)
	end
})
