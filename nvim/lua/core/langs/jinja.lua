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

    treesitter_exclude = true,
}

return M
