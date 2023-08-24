---@type LanguageDefinition
local M = {
	lang_name = "python",

	formatters = {
		function()
			return {
                require("formatter").filetypes.python.black,
                require("formatter").filetypes.python.isort,
            }
		end,
	},

	linters = {
		"mypy",
	},

	lsp_servers = {
		{
			lsp_name = "pyright",
			lsp_settings = {},
		},
        {
            lsp_name = "ruff_lsp",
            lsp_settings = {},
        },
	},
}

return M
