---@type LanguageDefinition
local M = {
    lang_name = "dockerfile",

    formatters = {},

    linters = {},

    lsp_servers = {
        {
            lsp_name = "dockerls",
            lsp_settings = {},
        },
    },
}

return M
