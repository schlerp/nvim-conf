local opt = vim.opt
local g = vim.g
local cmd = vim.cmd

vim.opt.termguicolors = true

-- disable builtin plugins
g.loaded_gzip = 1
g.loaded_zip = 1
g.loaded_zipPlugin = 1
g.loaded_tar = 1
g.loaded_tarPlugin = 1

g.loaded_getscript = 1
g.loaded_getscriptPlugin = 1
g.loaded_vimball = 1
g.loaded_vimballPlugin = 1
g.loaded_2html_plugin = 1

g.loaded_matchit = 1
g.loaded_matchparen = 1
g.loaded_logiPat = 1
g.loaded_rrhelper = 1

-- file browser settings
g.netrw_browse_split = 0
g.netrw_banner = 0
g.netrw_winsize = 25

-- catpuccin theme
g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha

-- line nos
opt.nu = true
--opt.relativenumber = true

-- mouse mode enable
opt.mouse = "a"

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
opt.colorcolumn = { 88, 100 }

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
