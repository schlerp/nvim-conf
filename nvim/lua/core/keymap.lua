local keymap = vim.keymap
local cmd = vim.cmd
local api = vim.api

local config = require("core.config") --- type: ignore

-- setup the keymaps
for _, key_def in ipairs(config.keymap_config.keymaps) do
    keymap.set(key_def.mode, key_def.keys, key_def.command, key_def.opts)
end

-- terminal (toggle term) keymaps
function _G.set_terminal_keymaps()
    for _, key_def in ipairs(config.keymap_config.terminal_keymaps) do
        keymap.set(key_def.mode, key_def.keys, key_def.command, key_def.opts)
    end
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
