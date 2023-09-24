local lang_configs = require("core.langs.init")

local file_types = {}
for lang_name, config in pairs(lang_configs) do
    file_types[lang_name] = config.linters
end

require("lint").linters_by_ft = file_types

vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
    callback = function() require("lint").try_lint() end,
})
