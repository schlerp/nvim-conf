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
		config = function()
			require("core.configs.alpha")
		end,
	},

	-- tree sitting
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = "VeryLazy",
		config = function()
			require("core.configs.treesitter")
		end,
	},

	-- indent gutters
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "VeryLazy",
		config = function()
			require("core.configs.indent")
		end,
	},

	-- surrounds manipulation
	{
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup()
		end,
		event = "VeryLazy",
	},

	-- notifications
	{
		"rcarriga/nvim-notify",
		event = "VeryLazy",
		config = function()
			require("core.configs.notify")
		end,
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
		config = function()
			require("core.configs.telescope")
		end,
	},

	-- buffer line (top tabs)
	{
		"akinsho/bufferline.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("bufferline").setup({
				options = {
					diagnostics = "nvim_lsp",
				},
			})
		end,
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
		event = "VeryLazy",
	},

	-- LSP
	{
		"VonHeikemen/lsp-zero.nvim",
		event = "VeryLazy",
		config = function()
			-- setup lsp
			require("core.lsp.init")
			require("core.diagnostics")
		end,
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ "williamboman/mason.nvim" }, -- Optional
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional
			{ "WhoIsSethDaniel/mason-tool-installer.nvim" }, -- Optional

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
			require("core.terminal")
		end,
		event = "VeryLazy",
	},

	-- win bar breadcrumbs
	{
		"Bekaboo/dropbar.nvim",
		config = function()
			require("dropbar").setup({})
		end,
		event = "VeryLazy",
	},

	-- linter
	{
		"mfussenegger/nvim-lint",
		config = function()
			require("core.configs.lint")
		end,
		event = "VeryLazy",
	},

	-- formatter
	{
		"mhartington/formatter.nvim",
		config = function()
			require("core.configs.formatter")
		end,
		event = "VeryLazy",
	},

	-- hovers
	{
		"lewis6991/hover.nvim",
		config = function()
			require("core.configs.hover")
		end,
		event = "VeryLazy",
	},

	-- documentation generator
	{
		"danymat/neogen",
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = function()
			require("core.configs.neogen")
		end,
		version = "*",
		event = "VeryLazy",
	},

	-- toggle diagnostic lines
	{
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		config = function()
			require("lsp_lines").setup()
		end,
		event = "VeryLazy",
	},

	--noice (better UI)
	--{
	--	"folke/noice.nvim",
	--	dependencies = {
	--		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
	--		"MunifTanjim/nui.nvim",
	--	},
	--	config = function()
	--		require("core.configs.noice")
	--	end,
	--	event = "VeryLazy",
	--},

	{
		"j-hui/fidget.nvim",
		tag = "legacy",
		event = "LspAttach",
		config = function()
			require("core.configs.fidget")
		end,
	},

	-- gotta have that AI apparently...
	{
		"dpayne/CodeGPT.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		},
		event = "VeryLazy",
		config = function()
			require("core.codegpt")
		end,
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
