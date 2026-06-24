local function get_active_lsp()
	local msg = "No Active LSP"
	local clients = vim.lsp.get_clients({ bufnr = vim.api.nvim_get_current_buf() })
	if next(clients) == nil then
		return msg
	end
	return clients[1].name
end

return {
	get_active_lsp,
	color = { gui = "bold" }
}
