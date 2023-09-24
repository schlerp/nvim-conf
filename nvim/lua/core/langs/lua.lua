local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

---@type LanguageDefinition
local M = {
    lang_name = "lua",

    formatters = {
        "stylua",
    },

    linters = {
        "luacheck",
    },

    lsp_servers = {
        {
            lsp_name = "lua_ls",

            lsp_settings = {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim", "use" },
                        },
                        telemetry = {
                            enable = false,
                        },
                        runtime = {
                            version = "LuaJIT",
                            path = runtime_path,
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                            checkThirdParty = false,
                        },
                    },
                },
            },
        },
    },
}

return M
