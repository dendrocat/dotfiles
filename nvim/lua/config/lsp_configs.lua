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

config.omnisharp = {
	cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()),
		"-z", "--loglevel", "error" },
	settings = {
		FormattingOptions = {
			EnableEditorConfigSupport = false,
			OrganizeImports = true,
		},
		Sdk = {
			IncludePrereleases = true,
		},
		RoslynExtensionsOptions = {
			EnableAnalyzersSupport = false,
			EnableEditorConfigSupport = false,
			EnableDecompilationSupport = true,
			EnableImportCompletion = true,
		},
		OmniSharp = {
			EnableAsyncCompletion = true,
			EnableEditorVisualizerSupport = true,
			EnableRoslynAnalyzers = false,
		},
	},
}

return config
