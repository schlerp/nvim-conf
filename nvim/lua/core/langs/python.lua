---@type LanguageDefinition
local M = {
    lang_name = "python",

    formatters = {
        "black",
    },

    linters = {},

    lsp_servers = {
        {
            lsp_name = "pylsp",
            lsp_settings = {
                settings = {
                    pylsp = {
                        plugins = {
                            flake8 = {
                                enabled = false,
                                config = "$HOME/projects/kraken-core/src/setup.cfg",
                            },
                            pyls_isort = { enabled = true },
                            pylsp_mypy = {
                                enabled = true,
                                dmypy = true,
                                live_mode = false,
                            },
                        },
                    },
                },
                flags = {
                    debounce_text_changes = 200,
                },
            },
        },
        {
            lsp_name = "ruff_lsp",
            lsp_settings = {},
        },
    },
}

return M
