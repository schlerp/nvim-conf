local M = {}

---@type KeymapDefinition[]
M.keymaps = {
    -- telescope keymaps
    {
        mode = "n",
        keys = "<leader>ff",
        command = function() require("telescope.builtin").find_files() end,
    },
    {
        mode = "n",
        keys = "<leader>fF",
        command = function() require("telescope.builtin").git_files() end,
    },
    {
        mode = "n",
        keys = "<leader>fg",
        command = function() require("telescope.builtin").live_grep() end,
    },
    {
        mode = "n",
        keys = "<leader>fb",
        command = function() require("telescope.builtin").buffers() end,
    },
    {
        mode = "n",
        keys = "<leader>fh",
        command = function() require("telescope.builtin").help_tags() end,
    },

    -- neogen (document generator)
    {
        mode = "n",
        keys = "<leader>d",
        command = function() require("neogen").generate() end,
    },

    -- gitsigns
    {
        mode = "n",
        keys = "<leader>gb",
        command = function() require("gitsigns").toggle_current_line_blame() end,
    },

    -- neogit
    {
        mode = "n",
        keys = "<leader>gg",
        command = function() require("neogit").open() end,
    },

    -- sourcegraph
    {
        mode = "n",
        keys = "<leader>ss",
        command = function() require("sg.extensions.telescope").fuzzy_search_results() end,
    },
}

---@type KeymapDefinition[]
M.terminal_keymaps = {
    {
        mode = "t",
        keys = "<esc>",
        command = [[<C-\><C-n>]],
        opts = { buffer = 0 },
    },
    {
        mode = "t",
        keys = "jk",
        command = [[<C-\><C-n>]],
        opts = { buffer = 0 },
    },
    {
        mode = "t",
        keys = "<C-h>",
        command = [[<Cmd>wincmd h<CR>]],
        opts = { buffer = 0 },
    },
    {
        mode = "t",
        keys = "<C-j>",
        command = [[<Cmd>wincmd j<CR>]],
        opts = { buffer = 0 },
    },
    {
        mode = "t",
        keys = "<C-k>",
        command = [[<Cmd>wincmd k<CR>]],
        opts = { buffer = 0 },
    },
    {
        mode = "t",
        keys = "<C-l>",
        command = [[<Cmd>wincmd l<CR>]],
        opts = { buffer = 0 },
    },
}

return M
