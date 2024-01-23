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

    -- gitsigns
    {
        mode = "n",
        keys = "<leader>gb",
        command = function() require("gitsigns").toggle_current_line_blame() end,
    },
    -- trouble (diagnostics)
    {
        mode = "n",
        keys = "<leader>xx",
        command = function() require("trouble").toggle() end,
    },
    {
        mode = "n",
        keys = "<leader>xw",
        command = function() require("trouble").toggle("workspace_diagnostics") end,
    },
    {
        mode = "n",
        keys = "<leader>xd",
        command = function() require("trouble").toggle("document_diagnostics") end,
    },
    {
        mode = "n",
        keys = "<leader>xq",
        command = function() require("trouble").toggle("quickfix") end,
    },
    {
        mode = "n",
        keys = "<leader>xl",
        command = function() require("trouble").toggle("loclist") end,
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
