local config = require("config.features")
local gitbrowse_utils = require("core.utils.gitbrowse")

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
        mode = "n",
        keys = "<leader>gbb",
        command = function()
            require("snacks").gitbrowse(
                gitbrowse_utils.build_gitbrowse_options(true, false)
            )
        end,
        opts = { desc = "Open file for branch in browser" },
    },
    {
        mode = "v",
        keys = "<leader>gbb",
        command = function()
            require("snacks").gitbrowse(
                gitbrowse_utils.build_gitbrowse_options(true, true)
            )
        end,
        opts = { desc = "Open lines for branch in browser" },
    },
    {
        mode = "n",
        keys = "<leader>gbm",
        command = function()
            require("snacks").gitbrowse(
                gitbrowse_utils.build_gitbrowse_options(false, false)
            )
        end,
        opts = { desc = "Open file for default branch in browser" },
    },
    {
        mode = "v",
        keys = "<leader>gbm",
        command = function()
            require("snacks").gitbrowse(
                gitbrowse_utils.build_gitbrowse_options(false, true)
            )
        end,
        opts = { desc = "Open lines for default branch in browser" },
    },
    {
        mode = "n",
        keys = "<leader>gi",
        command = function() require("snacks").picker.gh_issue() end,
        opts = { desc = "GitHub Issues (open)" },
    },
    {
        mode = "n",
        keys = "<leader>gI",
        command = function() require("snacks").picker.gh_issue({ state = "all" }) end,
        opts = { desc = "GitHub Issues (all)" },
    },
    {
        mode = "n",
        keys = "<leader>gp",
        command = function() require("snacks").picker.gh_pr() end,
        opts = { desc = "GitHub Pull Requests (open)" },
    },
    {
        mode = "n",
        keys = "<leader>gP",
        command = function() require("snacks").picker.gh_pr({ state = "all" }) end,
        opts = { desc = "GitHub Pull Requests (all)" },
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

-- add opencode.nvim keymaps
if config.use_copilot then
    table.insert(M.keymaps, {
        mode = "n",
        keys = "<leader>oA",
        command = function() require("opencode").ask() end,
        opts = { desc = "Ask opencode" },
    })
    table.insert(M.keymaps, {
        mode = "n",
        keys = "<leader>oa",
        command = function() require("opencode").ask("@cursor: ") end,
        opts = { desc = "Ask opencode about this" },
    })
    table.insert(M.keymaps, {
        mode = "v",
        keys = "<leader>oa",
        command = function() require("opencode").ask("@selection: ") end,
        opts = { desc = "Ask opencode about selection" },
    })
    table.insert(M.keymaps, {
        mode = "n",
        keys = "<leader>ot",
        command = function() require("opencode").toggle() end,
        opts = { desc = "Toggle embedded opencode" },
    })
    table.insert(M.keymaps, {
        mode = "n",
        keys = "<leader>on",
        command = function() require("opencode").command("session_new") end,
        opts = { desc = "New session" },
    })
    table.insert(M.keymaps, {
        mode = "n",
        keys = "<leader>oy",
        command = function() require("opencode").command("messages_copy") end,
        opts = { desc = "Copy last message" },
    })
    table.insert(M.keymaps, {
        mode = "n",
        keys = "<S-C-u>",
        command = function() require("opencode").command("messages_half_page_up") end,
        opts = { desc = "Scroll messages up" },
    })
    table.insert(M.keymaps, {
        mode = "n",
        keys = "<S-C-d>",
        command = function() require("opencode").command("messages_half_page_down") end,
        opts = { desc = "Scroll messages down" },
    })
    table.insert(M.keymaps, {
        mode = { "n", "v" },
        keys = "<leader>op",
        command = function() require("opencode").select_prompt() end,
        opts = { desc = "Select prompt" },
    })
    table.insert(M.keymaps, {
        mode = "n",
        keys = "<leader>oe",
        command = function()
            require("opencode").prompt("Explain @cursor and its context")
        end,
        opts = { desc = "Explain code near cursor" },
    })
end

-- add sidekick.nvim keymaps
if config.use_copilot then
    table.insert(M.keymaps, {
        mode = "n",
        keys = "<tab>",
        command = function()
            if not require("sidekick").nes_jump_or_apply() then return "<Tab>" end
        end,
        opts = { desc = "Goto/Apply Next Edit Suggestion", expr = true },
    })
    table.insert(M.keymaps, {
        mode = { "n", "t", "i", "x" },
        keys = "<c-.>",
        command = function() require("sidekick.cli").toggle() end,
        opts = { desc = "Sidekick Toggle" },
    })
    table.insert(M.keymaps, {
        mode = "n",
        keys = "<leader>aa",
        command = function() require("sidekick.cli").toggle() end,
        opts = { desc = "Sidekick Toggle CLI" },
    })
    table.insert(M.keymaps, {
        mode = "n",
        keys = "<leader>as",
        command = function() require("sidekick.cli").select() end,
        opts = { desc = "Select CLI" },
    })
    table.insert(M.keymaps, {
        mode = "n",
        keys = "<leader>ad",
        command = function() require("sidekick.cli").close() end,
        opts = { desc = "Detach a CLI Session" },
    })
    table.insert(M.keymaps, {
        mode = { "x", "n" },
        keys = "<leader>at",
        command = function() require("sidekick.cli").send({ msg = "{this}" }) end,
        opts = { desc = "Send This" },
    })
    table.insert(M.keymaps, {
        mode = "n",
        keys = "<leader>af",
        command = function() require("sidekick.cli").send({ msg = "{file}" }) end,
        opts = { desc = "Send File" },
    })
    table.insert(M.keymaps, {
        mode = "x",
        keys = "<leader>av",
        command = function() require("sidekick.cli").send({ msg = "{selection}" }) end,
        opts = { desc = "Send Visual Selection" },
    })
    table.insert(M.keymaps, {
        mode = { "n", "x" },
        keys = "<leader>ap",
        command = function() require("sidekick.cli").prompt() end,
        opts = { desc = "Sidekick Select Prompt" },
    })
    table.insert(M.keymaps, {
        mode = "n",
        keys = "<leader>ac",
        command = function()
            require("sidekick.cli").toggle({ name = "claude", focus = true })
        end,
        opts = { desc = "Sidekick Toggle Claude" },
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
