---@alias BuiltinLangs
---| "lua"
---| "python"
---| "rust"
---| "markdown"
---| "svelte"
---| "html"
---| "typescript"
---| "bash"
---| "cpp"
---| "dockerfile"

---@class LspServerDefinition
---@field lsp_name string The name of the lsp server to setup
---@field lsp_settings table The config to be passed into lsp server setup function

---@class LanguageDefinition
---@field lang_name string The name of this language, eg. "lua"
---@field formatter_lang_name string? The name of this language for formatter.nvim (falls back to lang_name if not set), eg. "lua"
---@field formatters string[] An array of functions that initialise formatters
---@field linters string[] An array of linter names (strings)
---@field lsp_servers LspServerDefinition[] An array of LspServerDefinitions

---@class NvimLanguageConfig
---@field enabled_langs BuiltinLangs[] The list of enabled languages
---@field custom_lang_defs LanguageDefinition[] A list of custom language definitions

---@class NvimConfig
---@field lang_config NvimLanguageConfig | nil The nvim language config from `config.lang_config.lua`
