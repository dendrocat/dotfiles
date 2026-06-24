local config = {}
config.scope = {
	show_start = false,
	show_end = false,
}
config.indent = {
	char = '│',
}

require('ibl').setup(config)
