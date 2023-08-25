local plugins = {
	-- many plugins require this
	{
		"nvim-lua/plenary.nvim",
	},

	-- colour scheme
	{
		"catppuccin/nvim",
		as = "catppuccin",
		config = function()
			vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
			require("catppuccin").setup()
			vim.api.nvim_command("colorscheme catppuccin")
		end,
	},

	-- start page
	{
		"goolord/alpha-nvim",
	},

	-- tree sitting
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = "VeryLazy",
	},

	-- indent gutters
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "LspAttach",
	},

	-- surrounds manipulation
	{
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup()
		end,
		event = "LspAttach",
	},

	-- notifications
	{
		"rcarriga/nvim-notify",
		event = "VeryLazy",
	},

	-- telescope
	{
		"nvim-telescope/telescope.nvim",
		event = "VeryLazy",
		dependencies = {
			"gbrlsnchs/telescope-lsp-handlers.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
			},
		},
	},

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
		event = "LspAttach",
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
	},

    -- terminal
	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("toggleterm").setup()
		end,
		event = "VeryLazy",
	},

	-- win bar breadcrumbs
	{
		"Bekaboo/dropbar.nvim",
		config = function()
			require("dropbar").setup({})
		end,
		event = "LspAttach",
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

	-- hovers
	{
		"lewis6991/hover.nvim",
		config = function()
			require("core.configs.hover")
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
require("lazy").setup(plugins)
