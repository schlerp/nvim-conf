---@type LanguageDefinition
local M = {
	lang_name = "bash",

	formatters = {
		"shfmt",
	},

	linters = {
		"shellcheck",
	},

	lsp_servers = {
		{
			lsp_name = "bashls",
			lsp_settings = {},
		},
	},
}

return M
