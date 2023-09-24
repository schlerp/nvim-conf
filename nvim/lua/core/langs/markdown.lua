---@type LanguageDefinition
local M = {
    lang_name = "markdown",

    formatters = {
        "mdformat",
    },

    linters = {
        "markdownlint",
        "vale",
    },

    lsp_servers = {},
}

return M
