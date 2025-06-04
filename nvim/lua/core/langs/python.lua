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
            lsp_settings = {
                basedpyright = {
                    analysis = {
                        diagnosticMode = "workspace", -- openFilesOnly | workspace
                        inlayHints = {
                            callArgumentNames = true,
                        },
                        autoImportCompletions = true,
                        autoSearchPaths = true,
                    },
                    disableOrganizeImports = true,
                },
            },
        },
        {
            lsp_name = "ruff",
            lsp_settings = {},
        },
    },
}

return M
