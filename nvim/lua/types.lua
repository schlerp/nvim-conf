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

---@alias NvimMode
---| "n"
---| "i"
---| "v"
---| "x"
---| "t"

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

---@class KeymapDefinition
---@field mode NvimMode The mode this keymap will be mapped to
---@field keys string The actual keys that will be mapped
---@field command string | function The command string or function to be ran when `keys` are pressed
---@field opts table | nil The options to be passed into `vim.keymap.set()`

---@class NvimKeymapConfig
---@field keymaps KeymapDefinition[] The list of key maps to be setup
---@field terminal_keymaps KeymapDefinition[] The list of keymaps to be setup in `_G.set_terminal_keymaps()`

---@class NvimFeatureConfig
---@field use_source_graph boolean | nil If truthy, source graph will be installed and used
---@field use_scrollbars boolean | nil If truthy, scrollbars will be enabled
---@field use_start_page boolean | nil If truthy, the start page will be installed and used
---@field use_neogit boolean | nil If truthy, the start page will be installed and used
---@field use_copilot boolean | nil If truthy, copilot will be installed and enabled

---@class NvimConfig
---@field lang_config NvimLanguageConfig | nil The nvim language config from `config.langs.lua`
---@field keymap_config NvimKeymapConfig | nil The nvim keymap config from `config.keys.lua`
---@field feature_config NvimFeatureConfig | nil The nvim keymap config from `config.keys.lua`
