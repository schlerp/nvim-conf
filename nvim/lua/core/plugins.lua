local config = require("core.config")

local plugins = {
    -- many plugins require this
    {
        "nvim-lua/plenary.nvim",
        event = "VeryLazy",
    },

    -- colour scheme
    {
        "catppuccin/nvim",
        lazy = false,
        priority = 1000,
        config = function() require("core.configs.colorscheme") end,
    },

    -- noice (better gui)
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        config = function() require("core.configs.noice") end,
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
        },
    },

    -- snacks
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        config = function() require("core.configs.snacks") end,
    },

    -- tree sitting
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function() require("core.configs.treesitter") end,
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            "RRethy/nvim-treesitter-textsubjects",
        },
        event = "VeryLazy",
    },

    -- gitsigns - git tools
    {
        "lewis6991/gitsigns.nvim",
        config = function() require("core.configs.gitsigns") end,
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
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            -- setup lsp
            require("core.lsp.init")
            require("core.diagnostics")
        end,
        dependencies = {
            -- LSP Support
            { "williamboman/mason.nvim" }, -- Optional
            { "williamboman/mason-lspconfig.nvim" }, -- Optional
            { "WhoIsSethDaniel/mason-tool-installer.nvim" }, -- Optional
            -- Autocompletion
            { "hrsh7th/nvim-cmp" }, -- Required
            { "hrsh7th/cmp-nvim-lsp" }, -- Required
            { "onsails/lspkind.nvim" }, -- Optional
        },
    },

    -- for developing neovim plugins
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
            enabled = function(root_dir)
                return vim.g.lazydev_enabled == nil and true or vim.g.lazydev_enabled
            end,
        },
        event = "VeryLazy",
    },

    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function() require("trouble").setup({}) end,
        event = "VeryLazy",
    },

    -- linter
    {
        "mfussenegger/nvim-lint",
        config = function() require("core.configs.lint") end,
        event = "LspAttach",
    },

    -- formatter
    {
        "mhartington/formatter.nvim",
        config = function() require("core.configs.formatter") end,
        event = "LspAttach",
    },

    -- cursor line (underline instances of word under cursor)
    {
        "RRethy/vim-illuminate",
        event = "LspAttach",
        config = function() require("core.configs.illuminate") end,
    },
}

if config.feature_config.use_scrollbars then
    -- scrollbars
    plugins[#plugins + 1] = {
        "petertriho/nvim-scrollbar",
        config = function() require("core.configs.scrollbar") end,
        event = "LspAttach",
    }
end

if config.feature_config.use_start_page then
    -- start page
    plugins[#plugins + 1] = {
        "goolord/alpha-nvim",
        config = function() require("core.configs.alpha") end,
    }
end

if config.feature_config.use_copilot then
    -- gotta have that AI apparently...
    plugins[#plugins + 1] = {
        "zbirenbaum/copilot.lua",
        event = "LspAttach",
        config = function() require("core.configs.copilot") end,
    }
    plugins[#plugins + 1] = {
        "NickvanDyke/opencode.nvim",
        dependencies = {
            { "folke/snacks.nvim", opts = { input = { enabled = true } } },
        },
        ---@type opencode.Opts
        opts = {
            -- Your configuration, if any — see lua/opencode/config.lua
        },
        keys = {
            -- Recommended keymaps
            {
                "<leader>oA",
                function() require("opencode").ask() end,
                desc = "Ask opencode",
            },
            {
                "<leader>oa",
                function() require("opencode").ask("@cursor: ") end,
                desc = "Ask opencode about this",
                mode = "n",
            },
            {
                "<leader>oa",
                function() require("opencode").ask("@selection: ") end,
                desc = "Ask opencode about selection",
                mode = "v",
            },
            {
                "<leader>ot",
                function() require("opencode").toggle() end,
                desc = "Toggle embedded opencode",
            },
            {
                "<leader>on",
                function() require("opencode").command("session_new") end,
                desc = "New session",
            },
            {
                "<leader>oy",
                function() require("opencode").command("messages_copy") end,
                desc = "Copy last message",
            },
            {
                "<S-C-u>",
                function() require("opencode").command("messages_half_page_up") end,
                desc = "Scroll messages up",
            },
            {
                "<S-C-d>",
                function() require("opencode").command("messages_half_page_down") end,
                desc = "Scroll messages down",
            },
            {
                "<leader>op",
                function() require("opencode").select_prompt() end,
                desc = "Select prompt",
                mode = { "n", "v" },
            },
            -- Example: keymap for custom prompt
            {
                "<leader>oe",
                function()
                    require("opencode").prompt("Explain @cursor and its context")
                end,
                desc = "Explain code near cursor",
            },
        },
    }
    plugins[#plugins + 1] = {
        "folke/sidekick.nvim",
        opts = {
            -- add any options here
            cli = {
                mux = {
                    backend = "tmux",
                    enabled = true,
                },
            },
        },
        keys = {
            {
                "<tab>",
                function()
                    -- if there is a next edit, jump to it, otherwise apply it if any
                    if not require("sidekick").nes_jump_or_apply() then
                        return "<Tab>" -- fallback to normal tab
                    end
                end,
                expr = true,
                desc = "Goto/Apply Next Edit Suggestion",
            },
            {
                "<c-.>",
                function() require("sidekick.cli").toggle() end,
                desc = "Sidekick Toggle",
                mode = { "n", "t", "i", "x" },
            },
            {
                "<leader>aa",
                function() require("sidekick.cli").toggle() end,
                desc = "Sidekick Toggle CLI",
            },
            {
                "<leader>as",
                function() require("sidekick.cli").select() end,
                -- Or to select only installed tools:
                -- require("sidekick.cli").select({ filter = { installed = true } })
                desc = "Select CLI",
            },
            {
                "<leader>ad",
                function() require("sidekick.cli").close() end,
                desc = "Detach a CLI Session",
            },
            {
                "<leader>at",
                function() require("sidekick.cli").send({ msg = "{this}" }) end,
                mode = { "x", "n" },
                desc = "Send This",
            },
            {
                "<leader>af",
                function() require("sidekick.cli").send({ msg = "{file}" }) end,
                desc = "Send File",
            },
            {
                "<leader>av",
                function() require("sidekick.cli").send({ msg = "{selection}" }) end,
                mode = { "x" },
                desc = "Send Visual Selection",
            },
            {
                "<leader>ap",
                function() require("sidekick.cli").prompt() end,
                mode = { "n", "x" },
                desc = "Sidekick Select Prompt",
            },
            -- Example of a keybinding to open Claude directly
            {
                "<leader>ac",
                function()
                    require("sidekick.cli").toggle({ name = "claude", focus = true })
                end,
                desc = "Sidekick Toggle Claude",
            },
        },
    }
end

if config.feature_config.use_kraken then
    -- kraken nvui
    plugins[#plugins + 1] = {
        "octoenergy/kraken.nvim",
        config = function() require("core.configs.kraken") end,
        event = "LspAttach",
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
