local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct


local plugins = {
	"wbthomason/packer.nvim",
	"nvim-lua/plenary.nvim",
     {
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
	"nvim-treesitter/nvim-treesitter-context",
	"nvim-treesitter/playground",
	-- Visuals
	{
		"oxfist/night-owl.nvim",
		config = function()
			require("night-owl").setup({
				vim.cmd("colorscheme night-owl"),
			})
		end,
	},
	"nvim-tree/nvim-web-devicons",
	"nvim-lualine/lualine.nvim",
	-- LSP
	{
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup({
				icons = false,
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	},
	{
		"j-hui/fidget.nvim",
		tag = "legacy",
	},
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v1.x",
		dependencies = {
			-- LSP Support
			 "neovim/nvim-lspconfig" ,
			 "williamboman/mason.nvim" ,
			 "williamboman/mason-lspconfig.nvim" ,

			-- Autocompletion
			 "hrsh7th/nvim-cmp" ,
			 "hrsh7th/cmp-buffer" ,
			 "hrsh7th/cmp-path" ,
			 "saadparwaiz1/cmp_luasnip" ,
			 "hrsh7th/cmp-nvim-lsp",
			 "hrsh7th/cmp-nvim-lua" ,

			-- Snippgitsignsets
			 "L3MON4D3/LuaSnip" ,
			 "rafamadriz/friendly-snippets" ,

			-- Make TS Errors not cut off
			{
				"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
				config = function()
					require("lsp_lines").setup()
				end,
			},
		},
	},
	-- TODO: Prune these
	"williamboman/mason.nvim", -- in charge of managing lsp servers, linters & formatters
	"williamboman/mason-lspconfig.nvim", -- bridges gap b/w mason & lspconfig
	"neovim/nvim-lspconfig", -- easily configure language servers
	"hrsh7th/cmp-nvim-lsp", -- for autocompletion
	{
		"glepnir/lspsaga.nvim",
		branch = "main",
		requires = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	},
    -- enhanced lsp uis
	"onsails/lspkind.nvim", -- VS code like pictograms
	"jose-elias-alvarez/null-ls.nvim", -- configure formatters & linters
	"jayp0521/mason-null-ls.nvim", -- bridges gap b/w mason & null-ls
	-- Autocompletion
	"hrsh7th/nvim-cmp", -- completion plugin
	"hrsh7th/cmp-buffer", -- source for text in buffer
	"hrsh7th/cmp-path", -- source for file system paths
	"windwp/nvim-autopairs", -- auto close brackets
	-- Navigation
	"theprimeagen/harpoon",
	"theprimeagen/refactoring.nvim",
	"mbbill/undotree",
	-- Utils
	"numToStr/Comment.nvim", -- Comment blocks
	"folke/zen-mode.nvim", -- Focus one pane
	"github/copilot.vim", -- AI Autocomplete
	"jose-elias-alvarez/typescript.nvim", -- additional functionality for typescript server (e.g. rename file & update imports)
	"MunifTanjim/prettier.nvim", -- Formatter
	"tpope/vim-surround", -- Wrap Things
	-- Git
	"tpope/vim-fugitive",
    {
		"pwntester/octo.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope.nvim", tag = "0.1.4"},
			"kyazdani42/nvim-web-devicons",
		},
		config = function()
			require("octo").setup()
		end,
	},
	{
		"petertriho/cmp-git",
		requires = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("cmp").setup({
				sources = {
					{ name = "git" },
				},
			})
			require("cmp_git").setup()
		end,
	},
	"lewis6991/gitsigns.nvim",
	"f-person/git-blame.nvim",
	-- Snippets
	"L3MON4D3/LuaSnip", -- snippet engine
	"saadparwaiz1/cmp_luasnip", -- for autocompletion
	"rafamadriz/friendly-snippets", -- useful snippets
	-- Search
	"jremmen/vim-ripgrep",
	"duane9/nvim-rg"
};

require("lazy").setup(plugins)
