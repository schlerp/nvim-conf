local config = require("core.config")

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
            require("catppuccin").setup()
            vim.api.nvim_command("colorscheme catppuccin")
        end,
    },

    -- tree sitting
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = "VeryLazy",
        config = function() require("core.configs.treesitter") end,
    },

    -- indent gutters
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        event = "VeryLazy",
        config = function() require("core.configs.indent") end,
    },

    -- surrounds manipulation
    {
        "kylechui/nvim-surround",
        config = function() require("nvim-surround").setup() end,
        event = "VeryLazy",
    },

    -- notifications
    {
        "rcarriga/nvim-notify",
        event = "VeryLazy",
        config = function() require("core.configs.notify") end,
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
        config = function() require("core.configs.telescope") end,
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
        config = function() require("gitsigns").setup() end,
        event = "VeryLazy",
    },

    -- status line
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function() require("core.configs.lualine") end,
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
        config = function() require("core.terminal") end,
        event = "VeryLazy",
    },

    -- win bar breadcrumbs
    {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        version = "*",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        config = function() require("barbecue").setup({}) end,
        event = "VeryLazy",
    },

    -- linter
    {
        "mfussenegger/nvim-lint",
        config = function() require("core.configs.lint") end,
        event = "VeryLazy",
    },

    -- formatter
    {
        "mhartington/formatter.nvim",
        config = function() require("core.configs.formatter") end,
        event = "VeryLazy",
    },

    -- hovers
    {
        "lewis6991/hover.nvim",
        config = function() require("core.configs.hover") end,
        event = "VeryLazy",
    },

    -- documentation generator
    {
        "danymat/neogen",
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = function() require("core.configs.neogen") end,
        version = "*",
        event = "VeryLazy",
    },

    -- toggle diagnostic lines
    {
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        config = function() require("lsp_lines").setup() end,
        event = "VeryLazy",
    },

    -- add lsp server progress
    {
        "j-hui/fidget.nvim",
        tag = "legacy",
        event = "LspAttach",
        config = function() require("core.configs.fidget") end,
    },

    -- cursor line (underline instances of word under cursor)
    {
        "RRethy/vim-illuminate",
        event = "LspAttach",
        config = function() require("core.configs.illuminate") end,
    },
}

if config.feature_config.use_source_graph then
    -- sourcegraph plugin
    plugins[#plugins + 1] = {
        "sourcegraph/sg.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
        },
        config = function() require("sg").setup() end,
        event = "VeryLazy",
    }
end

if config.feature_config.use_scrollbars then
    -- scrollbars
    plugins[#plugins + 1] = {
        "petertriho/nvim-scrollbar",
        config = function() require("core.configs.scrollbar") end,
        event = "VeryLazy",
    }
end

if config.feature_config.use_start_page then
    -- start page
    plugins[#plugins + 1] = {
        "goolord/alpha-nvim",
        config = function() require("core.configs.alpha") end,
    }
end

if config.feature_config.use_neogit then
    -- Neogit (nice git interface)
    plugins[#plugins + 1] = {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim", -- required
            "nvim-telescope/telescope.nvim", -- optional
            "sindrets/diffview.nvim", -- optional
        },
        config = function() require("core.configs.neogit") end,
        event = "VeryLazy",
    }
end

if config.feature_config.use_copilot then
    -- gotta have that AI apparently...
    plugins[#plugins + 1] = {
        "zbirenbaum/copilot.lua",
        event = "VeryLazy",
        config = function() require("core.configs.copilot") end,
    }
end

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
