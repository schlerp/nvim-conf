---@type LanguageDefinition
local M = {
    lang_name = "python",

    formatters = {
        "ruff",
    },

    linters = {},

    lsp_servers = {
        {
            lsp_name = "ty",
            lsp_settings = {},
        },
        {
            lsp_name = "ruff",
            lsp_settings = {},
        },
    },
}

return M
