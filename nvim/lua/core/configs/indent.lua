require("ibl").setup({
    show_end_of_line = true,
    show_current_context = true,
    space_char_blankline = " ",
    buftype_exclude = { "terminal", "nofile", "quickfix", "prompt" },
    filetype_exclude = {
        "lspinfo",
        "packer",
        "checkhealth",
        "help",
        "man",
        "alpha",
        "",
    },
})
