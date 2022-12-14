vim.cmd [[packadd packer.nvim]]

return require('packer').startup(
	function(use)
		use 'wbthomason/packer.nvim'

		use 'nvim-lua/plenary.nvim' -- Common utils

		use 'EdenEast/nightfox.nvim' -- nightfox colorscheme

		use 'kyazdani42/nvim-web-devicons' -- Icons

		use 'norcalli/nvim-colorizer.lua' -- Color highlight

		use 'github/copilot.vim' -- Copilot

		use 'mvllow/modes.nvim' -- Highlight line based on mode

		use 'nat-418/boole.nvim' -- Toggle booleans, dates, etc

		use 'phaazon/hop.nvim' -- Hop to a character

		use 'ThePrimeagen/harpoon' -- Create and move between marks

		use 'maxmellon/vim-jsx-pretty' -- JSX/TSX syntax highlighting

		use 'lukas-reineke/indent-blankline.nvim' -- Indent guides

		use 'mbbill/undotree' -- Undo history

		use 'gelguy/wilder.nvim' -- Command line hints

		use 'feline-nvim/feline.nvim' -- Statusline

		use 'petertriho/nvim-scrollbar' -- Scrollbar

		use 'kdheepak/lazygit.nvim' -- Visual Git

		use 'xorid/swap-split.nvim' -- Swap split windows

		use 'mattkubej/jest.nvim' -- Run Jest in nvim

		use 'acksld/nvim-neoclip.lua' -- Clipboard manager

		use {
			'hrsh7th/nvim-cmp',
			'L3MON4D3/LuaSnip',
			'j-hui/fidget.nvim',
			'folke/neodev.nvim',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-nvim-lsp',
			'neovim/nvim-lspconfig',
			'williamboman/mason.nvim',
			'simrat39/rust-tools.nvim',
			'ray-x/lsp_signature.nvim',
			'jose-elias-alvarez/null-ls.nvim',
			'williamboman/mason-lspconfig.nvim',
			{
				'onsails/lspkind-nvim',
				config = function()
					require('lspkind').init()
				end
			}
		} -- LSP

		use {
			'nvim-tree/nvim-tree.lua',
			tag = 'nightly'
		} -- File tree

		use {
			'lewis6991/impatient.nvim',
			config = function()
				require('impatient')
			end
		} -- Speed up startup

		use {
			'beauwilliams/focus.nvim',
			config = function()
				require('focus').setup()
			end
		} -- Window management

		use {
			'numToStr/Comment.nvim',
			requires = {
				'JoosepAlviste/nvim-ts-context-commentstring' -- JSX/TSX commenting
			},
			config = function()
				require('Comment').setup()
			end
		} -- Commenting shortcuts

		use {
			'karb94/neoscroll.nvim',
			config = function()
				require('neoscroll').setup()
			end
		} -- Smooth scrolling

		use {
			'akinsho/toggleterm.nvim',
			tag = '*',
			config = function()
				require('toggleterm').setup()
			end
		} -- Popup windows

		use {
			'kylechui/nvim-surround',
			tag = '*',
			config = function()
				require('nvim-surround').setup()
			end
		} -- Edit surrounding brackets/quotes/tags

		use { 'akinsho/git-conflict.nvim',
			config = function()
				require('git-conflict').setup()
			end
		} -- Git conflicts

		use { 'windwp/nvim-autopairs',
			requires = {
				'windwp/nvim-ts-autotag' -- Auto html tags
			},
			config = function()
				require('nvim-ts-autotag').setup()
			end
		} -- Auto brackets

		use {
			"lewis6991/gitsigns.nvim",
			config = function()
				require('gitsigns').setup()
				require("scrollbar.handlers.gitsigns").setup()
			end
		} -- Git integration

		use {
			'mfussenegger/nvim-dap',
			requires = 'theHamsta/nvim-dap-virtual-text'
		} -- Debugging

		use({
			'nvim-telescope/telescope.nvim',
			requires = {
				{ 'nvim-telescope/telescope-dap.nvim' }, -- Debugging integration
				{ 'nvim-telescope/telescope-file-browser.nvim' }, -- File browser
				{ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' } -- Fuzzy finding
			},
		}) -- File search

		use({
			'iamcco/markdown-preview.nvim',
			run = function()
				vim.fn['mkdp#util#install']()
			end,
		}) -- Markdown preview

		use {
			'nvim-treesitter/nvim-treesitter',
			requires = {
				'p00f/nvim-ts-rainbow' -- Rainbow brackets
			},
			run = function()
				require('nvim-treesitter.install').update({ with_sync = true })()
			end,
		} -- Treesitter ( syntax highlighting etc.. )
	end
)
