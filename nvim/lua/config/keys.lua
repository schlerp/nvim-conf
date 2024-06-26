local M = {}

---@type KeymapDefinition[]
M.keymaps = {
    -- telescope keymaps
    {
        mode = "n",
        keys = "<leader>ff",
        command = function() require("telescope.builtin").find_files() end,
        opts = { desc = "Fuzzy find files" },
    },
    {
        mode = "n",
        keys = "<leader>fF",
        command = function() require("telescope.builtin").git_files() end,
        opts = { desc = "Fuzzy find files (git files)" },
    },
    {
        mode = "n",
        keys = "<leader>fg",
        command = function() require("telescope.builtin").live_grep() end,
        opts = { desc = "Fuzzy live grep" },
    },
    {
        mode = "n",
        keys = "<leader>fb",
        command = function() require("telescope.builtin").buffers() end,
        opts = { desc = "Fuzzy find buffers" },
    },
    {
        mode = "n",
        keys = "<leader>fh",
        command = function() require("telescope.builtin").help_tags() end,
        opts = { desc = "Fuzzy find help tags" },
    },

    -- gitsigns
    {
        mode = "n",
        keys = "<leader>gb",
        command = function() require("gitsigns").toggle_current_line_blame() end,
        opts = { desc = "Toggle current line git blame" },
    },
    -- trouble (diagnostics)
    {
        mode = "n",
        keys = "<leader>xx",
        command = "<cmd>Trouble diagnostics toggle<cr>",
        opts = { desc = "Open trouble (diagnostics)" },
    },
    {
        mode = "n",
        keys = "<leader>xd",
        command = "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        opts = { desc = "View document diagnostics" },
    },
    {
        mode = "n",
        keys = "<leader>xq",
        command = "<cmd>Trouble qflist toggle<cr>",
        opts = { desc = "Open trouble quickfix" },
    },
    -- copy current filename into system copy/paste buffer
    {
        mode = "n",
        keys = "<leader>cf",
        command = function()
            vim.fn.setreg("*", vim.fn.expand("%"))
            vim.notify("Copied file path to clipboard")
        end,
        opts = { desc = "Copy current filepath to clipboard" },
    },
    {
        mode = "n",
        keys = "<leader>cF",
        command = function()
            vim.fn.setreg("*", vim.fn.expand("%:p"))
            vim.notify("Copied absolute file path to clipboard")
        end,
        opts = { desc = "Copy current filepath to clipboard (absolute)" },
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
