local lang_configs = require("core.langs.init")

for _, config in pairs(lang_configs) do
    for _, lsp_definition in pairs(config.lsp_servers) do
        local lsp_name = lsp_definition.lsp_name
        vim.lsp.config(lsp_name, lsp_definition.lsp_settings)
        vim.lsp.enable(lsp_name)
        local status, err = pcall(vim.lsp.enable, lsp_name)
        if not status then
            print("Error enabling LSP: " .. lsp_name)
            print(err)
        end
    end
end
