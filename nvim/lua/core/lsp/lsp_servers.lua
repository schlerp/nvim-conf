local lang_configs = require("core.langs.init")
local lspconfig = require("lspconfig")

for _, config in ipairs(lang_configs) do
	for _, lsp_definition in ipairs(config.lsp_servers) do
		lspconfig[lsp_definition.lsp_name].setup(lsp_definition.lsp_settings)
	end
end
