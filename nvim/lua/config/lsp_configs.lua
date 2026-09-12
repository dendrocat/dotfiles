local config = {}

config.clangd = {
	cmd = { "clangd", "--clang-tidy", },
	init_options = {
		fallbackFlags = { "-std=c++23" },
	},
}

config.lua_ls = {
	settings = {
		Lua = {
			runtime = { version = "LuaJIT", },
			telemetry = { enable = false, },
		}
	}
}

config.roslyn = {
	cmd = { "/home/uki/.local/share/nvim/mason/bin/roslyn-language-server", "--stdio", "--daemon-mode", "--clientProcessId", tostring(vim.fn.getpid()) },
	filetypes = { "cs" },
}
return config
