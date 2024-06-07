local cmd = vim.cmd

local function debug_notify(msg) vim.notify(msg, vim.log.levels.DEBUG) end

-- write current buffer to tempfile on focus
vim.api.nvim_create_autocmd({ "BufEnter" }, {
    --pattern = { "*.py", "*.lua" },
    callback = function()
        local temp_file = "~/.local/share/nvim/current_file_path"
        local current_file = vim.fn.expand("%")
        os.execute(string.format("echo '%s' > %s", current_file, temp_file))
        debug_notify(string.format("wrote %s to %s", current_file, temp_file))
    end,
})

-- TODO: convert this to lua
-- highlight yanked text for 200ms using the "Visual" highlight group
cmd([[
    augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=200})
    augroup END
]])
