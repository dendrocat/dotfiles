local M = {}

function M.is_unity_project()
	local cwd = vim.fn.getcwd()
	local assembly_file = cwd .. "/Assembly-CSharp.csproj"
	return vim.fn.filereadable(assembly_file) == 1
end

return M
