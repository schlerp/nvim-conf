local opt = vim.opt
local g = vim.g
local cmd = vim.cmd

-- mouse mode enable
opt.mouse = "a"

-- file browser settings
g.netrw_browse_split = 0
g.netrw_banner = 0
g.netrw_winsize = 25

-- line nos
opt.nu = true
--opt.relativenumber = true

-- tabs
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

-- general editor settings
opt.smartindent = true
opt.wrap = false

-- temp files
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.hlsearch = false
opt.incsearch = true

-- colours
opt.termguicolors = true

-- Give more space for displaying messages.
--opt.cmdheight = 1

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
opt.updatetime = 100

-- Don't pass messages to |ins-completion-menu|.
opt.shortmess:append("c")

-- code gutter
opt.colorcolumn = "88"

-- set leader
g.mapleader = " "

opt.scrolloff = 2
opt.sidescrolloff = 15
opt.sidescroll = 1

-- highlight yanked text for 200ms using the "Visual" highlight group
cmd([[
    augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=200})
    augroup END
]])
