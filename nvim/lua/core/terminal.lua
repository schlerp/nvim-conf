local Terminal = require("toggleterm.terminal").Terminal
local floatterm = Terminal:new({
    hidden = true,
    direction = "float",
    float_opts = { border = "curved" },
})

function _floatterm_toggle() floatterm:toggle() end

vim.keymap.set(
    "n",
    "<leader>t",
    "<cmd>lua _floatterm_toggle()<CR>",
    { noremap = true, silent = true }
)

require("toggleterm").setup()
