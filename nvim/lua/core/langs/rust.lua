---@type LanguageDefinition
local M = {
    lang_name = "rust",

    formatters = {
        "rustfmt",
    },

    linters = {},

    lsp_servers = {
        {
            lsp_name = "rust_analyzer",
            lsp_settings = {
                ["rust-analyzer"] = {
                    checkOnSave = {
                        command = "clippy",
                    },
                    cargo = {
                        extraEnv = { CARGO_PROFILE_RUST_ANALYZER_INHERITS = "dev" },
                        extraArgs = { "--profile", "rust-analyzer" },
                    },
                },
            },
        },
    },
}

return M
