local config = require("config.features")

local M = {}

---@type KeymapDefinition[]
M.keymaps = {
    -- picker keymaps
    {
        mode = "n",
        keys = "<leader>ex",
        command = function() require("snacks").picker.explorer() end,
        opts = { desc = "Snacks file explorer" },
    },
    {
        mode = "n",
        keys = "<leader>ff",
        command = function() require("snacks").picker.files() end,
        opts = { desc = "Fuzzy find files" },
    },
    {
        mode = "n",
        keys = "<leader>fF",
        command = function() require("snacks").picker.git_files() end,
        opts = { desc = "Fuzzy find files (git files)" },
    },
    {
        mode = "n",
        keys = "<leader>fg",
        command = function() require("snacks").picker.grep() end,
        opts = { desc = "Fuzzy live grep" },
    },
    {
        mode = "n",
        keys = "<leader>fb",
        command = function() require("snacks").picker.buffers() end,
        opts = { desc = "Fuzzy find buffers" },
    },
    {
        mode = "n",
        keys = "<leader>fh",
        command = function() require("snacks").picker.help() end,
        opts = { desc = "Fuzzy find help tags" },
    },
    {
        mode = { "n", "v" },
        keys = "<leader>gc",
        command = function() require("snacks").gitbrowse() end,
        opts = { desc = "Open commit line(s) in browser" },
    },
    -- lsp keymaps
    {
        mode = "n",
        keys = "gd",
        command = function() require("snacks").picker.lsp_definitions() end,
        opts = { desc = "Goto Definition" },
    },
    {
        mode = "n",
        keys = "gD",
        command = function() require("snacks").picker.lsp_declarations() end,
        opts = { desc = "Goto Declaration" },
    },
    {
        mode = "n",
        keys = "gr",
        command = function() require("snacks").picker.lsp_references() end,
        nowait = true,
        opts = { desc = "References" },
    },
    {
        mode = "n",
        keys = "gI",
        command = function() require("snacks").picker.lsp_implementations() end,
        opts = { desc = "Goto Implementation" },
    },
    {
        mode = "n",
        keys = "gy",
        command = function() require("snacks").picker.lsp_type_definitions() end,
        opts = { desc = "Goto T[y]pe Definition" },
    },
    {
        mode = "n",
        keys = "<leader>ss",
        command = function() require("snacks").picker.lsp_symbols() end,
        opts = { desc = "LSP Symbols" },
    },
    {
        mode = "n",
        keys = "<leader>sS",
        command = function() require("snacks").picker.lsp_workspace_symbols() end,
        opts = { desc = "LSP Workspace Symbols" },
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

-- add kraken.nvim keymaps
if config.use_kraken then
    table.insert(M.keymaps, {
        mode = "n",
        keys = "<leader>kk",
        command = "<cmd>KLocateTests<cr>",
        opts = { desc = "Open test file for current file (kraken-core)" },
    })
    table.insert(M.keymaps, {
        mode = "n",
        keys = "<leader>kn",
        command = "<cmd>KAddTestFile<cr>",
        opts = { desc = "Add test file for current file (kraken-core)" },
    })
end

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
