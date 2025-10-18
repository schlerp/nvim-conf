local lang_configs = require("core.langs.init")
local lspconfig = vim.lsp.config

for _, config in pairs(lang_configs) do
    for _, lsp_definition in pairs(config.lsp_servers) do
        local lsp = lspconfig[lsp_definition.lsp_name]
        if lsp.setup ~= nil then
            local status, err = pcall(lsp.setup, lsp_definition.lsp_settings)
            if not status then
                print("Error setting up LSP: " .. lsp_definition.lsp_name)
                print(err)
            end
        end
    end
end
