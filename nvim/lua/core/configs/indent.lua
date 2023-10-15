require("ibl").setup({
    scope = { enabled = true },
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
