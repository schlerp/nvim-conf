-- Utilities for creating configurations
local lang_configs = require("core.langs.init")

local file_types = {}
for lang_name, config in ipairs(lang_configs) do
	file_types[lang_name] = config.formatters
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
})

-- add autocommand to format on save
vim.cmd([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.lua FormatWrite
augroup END
]])
