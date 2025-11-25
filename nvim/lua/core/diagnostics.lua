vim.diagnostic.config({
    virtual_text = {
        prefix = "●",
    },
    virtual_lines = false, --{ only_current_line = true },
    severity_sort = true,
    signs = true,
    underline = true,
    update_in_insert = true,
    float = {
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
})
