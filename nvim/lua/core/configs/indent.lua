require("ibl").setup({
    show_end_of_line = true,
    show_current_context = true,
    space_char_blankline = " ",
    exclude = {
        filetypes = {
            "lspinfo",
            "packer",
            "checkhealth",
            "help",
            "man",
            "alpha",
            "",
        },
        buftypes = { "terminal", "nofile", "quickfix", "prompt" },
    },
})
