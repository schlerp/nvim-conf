---@type LanguageDefinition
local M = {
	lang_name = "svelte",

	formatters = {
		"prettier",
	},

	linters = {},

	lsp_servers = {
		{
			lsp_name = "svelte",
			lsp_settings = {},
		},
	},
}

return M