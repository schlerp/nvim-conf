local utils = require("core.utils")

local default_plugins = {
	-- many plugins require this
	{
		"nvim-lua/plenary.nvim",
	},

	-- colour scheme
	{
		"catppuccin/nvim",
		as = "catppuccin",
		config = function()
			vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
			require("catppuccin").setup()
			vim.api.nvim_command("colorscheme catppuccin")
		end,
	},

	-- tree sitting
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = "VeryLazy",
	},

	-- indent gutters
	{ "lukas-reineke/indent-blankline.nvim", event = "VeryLazy" },

	-- surrounds manipulation
	{
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup()
		end,
		event = "VeryLazy",
	},

	-- notifications
	{ "rcarriga/nvim-notify", event = "VeryLazy" },

	-- telescope
	{ "nvim-telescope/telescope.nvim", event = "VeryLazy" },

	-- buffer line (top tabs)
	{
		"akinsho/bufferline.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		event = "VeryLazy",
	},

	-- gitsigns - git tools
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
		event = "VeryLazy",
	},

	-- status line
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			opt = true,
		},
		config = true,
	},

	-- LSP
	{
		"VonHeikemen/lsp-zero.nvim",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ "williamboman/mason.nvim" }, -- Optional
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "L3MON4D3/LuaSnip" }, -- Required
			{ "onsails/lspkind.nvim" }, -- Optional
		},
		event = "VeryLazy",
	},

	-- enhanced LSP plugin
	{
		"nvimdev/lspsaga.nvim",
		config = function()
			require("lspsaga").setup({})
		end,
		event = "LspAttach",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},

	-- linter
	{
		"mfussenegger/nvim-lint",
		config = function()
			require("core.configs.lint")
		end,
		event = "LspAttach",
	},

	-- formatter
	{
		"mhartington/formatter.nvim",
		config = function()
			require("core.configs.formatter")
		end,
		event = "LspAttach",
	},
}

local function setup_lazy()
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
end

-- init Lazy.nvim
setup_lazy()

-- setup config using plugins array
local plugins = require("config.plugins")
local merged_plugins = utils.merge_arrays(default_plugins, plugins)
require("lazy").setup(merged_plugins)
