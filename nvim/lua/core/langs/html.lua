---@type LanguageDefinition
local M = {
	lang_name = "html",

	formatters = { "prettier" },

	linters = {
		"tidy",
	},

	lsp_servers = {
		lsp_name = "html",
		lsp_settings = {},
	},
}

return M
