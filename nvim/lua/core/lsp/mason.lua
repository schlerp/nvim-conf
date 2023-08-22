require("mason").setup({
	ui = {
		border = "rounded",
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
    ensure_installed = {
        "lua_ls",
        "luacheck",
    },
})
require("mason-lspconfig").setup()
