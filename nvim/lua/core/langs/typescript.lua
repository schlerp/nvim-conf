---@type LanguageDefinition
local M = {
    lang_name = "typescript",

    formatters = {},

    linters = {
        "eslint",
    },

    lsp_servers = {
        {
            lsp_name = "tsserver",
            lsp_settings = {},
        },
    },
}

return M
