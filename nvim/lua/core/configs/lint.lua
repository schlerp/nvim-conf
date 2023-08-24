local lang_configs = require("core.langs.init")

local file_types = {}
for lang_name, config in ipairs(lang_configs) do
	file_types[lang_name] = config.formatters
end

require("lint").linters_by_ft = file_types

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})
