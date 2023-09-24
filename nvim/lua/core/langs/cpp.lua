---@type LanguageDefinition
local M = {
    lang_name = "cpp",

    formatters = {
        "clang-format",
    },

    linters = {},

    lsp_servers = {
        {
            lsp_name = "clangd",
            lsp_settings = {},
        },
    },
}

return M
