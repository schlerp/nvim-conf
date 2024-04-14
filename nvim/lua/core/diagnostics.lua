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

local signs = { Error = "✘", Warn = "▲", Hint = "", Info = "⚑" }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
