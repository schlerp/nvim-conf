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
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
						},
					},
				},
			},
		},
	},
}

return M
