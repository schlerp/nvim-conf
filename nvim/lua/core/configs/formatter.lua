-- Utilities for creating configurations
local lang_configs = require("core.langs.init")

local file_types = {}
for _, config in pairs(lang_configs) do
    file_types[config.lang_name] = {}
    for _, formatter in ipairs(config.formatters) do
        local lang_name = config.lang_name
        if config.formatter_lang_name ~= nil then
            lang_name = config.formatter_lang_name
        end
        table.insert(
            file_types[config.lang_name],
            require("formatter.filetypes." .. lang_name)[formatter]
        )
    end
end

file_types["*"] = {
    require("formatter.filetypes.any").remove_trailing_whitespace,
}

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({
    -- Enable or disable logging
    logging = true,
    -- Set the log level
    log_level = vim.log.levels.WARN,
    -- All formatter configurations are opt-in
    filetype = file_types,
    -- check node modules first
    try_node_modules = true,
})

-- add autocommand to format on save
vim.cmd([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.lua,*.py,*.rs,*.md,*.sh FormatWrite
  autocmd BufWritePost *.html,*.ts,*.tsx,*.js,*.jsx !prettier "%" --write --log-level silent
augroup END
]])
