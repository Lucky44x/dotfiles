require('nvim-treesitter.configs').setup {
	ensure_installed = { "c", "rust", "lua", "vim", "vimdoc", "query" },
	auto_install = true,
	ignore_install = { "javascript" },
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
}
