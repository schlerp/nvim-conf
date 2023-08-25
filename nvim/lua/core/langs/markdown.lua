---@type LanguageDefinition
local M = {
	lang_name = "markdown",

	formatters = {
        "mdformat",
    },

	linters = {
		"markdownlint",
	},

	lsp_servers = {},
}

return M
