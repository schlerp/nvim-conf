---@type LanguageDefinition
local M = {
    lang_name = "svelte",

    formatters = {},

    linters = {
        "eslint",
    },

    lsp_servers = {
        {
            lsp_name = "svelte",
            lsp_settings = {},
        },
        {
            lsp_name = "tsserver",
            lsp_settings = {},
        },
    },
}

return M
