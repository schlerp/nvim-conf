---@type LanguageDefinition
local M = {
    lang_name = "python",

    formatters = {
        "ruff",
    },

    linters = {},

    lsp_servers = {
        {
            lsp_name = "pyright",
            lsp_settings = {},
        },
        {
            lsp_name = "ruff_lsp",
            lsp_settings = {},
        },
    },
}

return M
