---@type LanguageDefinition
local M = {
    lang_name = "jinja",

    formatters = { "prettier" },

    linters = {},

    lsp_servers = {
        {
            lsp_name = "html",
            lsp_settings = {},
        },
        {
            lsp_name = "jinja_lsp",
            lsp_settings = {},
        },
    },

    formatter_lang_name = "html",
    treesitter_lang = "html",
}

return M
