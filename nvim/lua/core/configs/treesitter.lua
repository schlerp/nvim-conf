require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"markdown",
		"python",
		"svelte",
		"bash",
		"lua",
		"rust",
		"css",
		"html",
		"javascript",
		"typescript",
	},
	highlight = { enable = true },
	indent = {
		enable = true,
		disable = { "python", "yaml" },
	},
})
