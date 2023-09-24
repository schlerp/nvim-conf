local lang_configs = require("core.langs.init")

local lang_names = {}
for _, config in pairs(lang_configs) do
    table.insert(lang_names, config.lang_name)
end

require("nvim-treesitter.configs").setup({
    ensure_installed = lang_names,
    highlight = { enable = true },
    indent = {
        enable = true,
        disable = { "python", "yaml" },
    },
})
