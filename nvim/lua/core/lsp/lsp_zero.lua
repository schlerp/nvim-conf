local lsp = require("lsp-zero")

-- lsp.preset("recommended")
lsp.set_preferences({
    setup_servers_on_start = true,
    set_lsp_keymaps = true,
    configure_diagnostics = true,
    cmp_capabilities = true,
    manage_nvim_cmp = true,
    call_servers = "local",
    sign_icons = {
        error = "✘",
        warn = "▲",
        hint = "",
        info = "⚑",
    },
})

lsp.setup_nvim_cmp({
    sources = {
        { name = "nvim_lsp", keyword_length = 2 },
        { name = "nvim_lua", keyword_length = 2 },
        { name = "path", keyword_length = 2 },
        { name = "buffer", keyword_length = 2 },
        { name = "luasnip", keyword_length = 2 },
    },
})

lsp.setup()
