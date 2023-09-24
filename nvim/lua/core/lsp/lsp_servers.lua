local lang_configs = require("core.langs.init")
local lspconfig = require("lspconfig")

for _, config in pairs(lang_configs) do
    for _, lsp_definition in pairs(config.lsp_servers) do
        lspconfig[lsp_definition.lsp_name].setup(lsp_definition.lsp_settings)
    end
end
