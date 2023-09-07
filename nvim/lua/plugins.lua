vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'nvim-treesitter/nvim-treesitter'
	use 'sheerun/vim-polyglot'
	use { 'catppuccin/nvim', as = "catpuccin" }
	use 'nvim-lualine/lualine.nvim'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'
	use 'rafamadriz/friendly-snippets'
	use 'ellisonleao/gruvbox.nvim'
	use 'elkowar/yuck.vim'
	use 'rebelot/kanagawa.nvim'
	use 'norcalli/nvim-colorizer.lua'
	use {
		'eraserhd/parinfer-rust'
	}
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons',
		},
	}
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
		requires = {
			'nvim-lua/plenary.nvim',
		},
	}
	use {
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		'neovim/nvim-lspconfig',
	}
end)

require('core.config.completions')
require('core.config.lsp')
require('core.config.telescope')
require('core.config.lualine')
require('core.config.theme')
require('core.config.nvim-treesitter')
require('core.config.nvim-tree')
require('core.config.highlighter')
