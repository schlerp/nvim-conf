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
---@field extra_mason? string[] An array of extra tools to install with mason

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
---@field use_scrollbars boolean | nil If truthy, scrollbars will be enabled
---@field use_start_page boolean | nil If truthy, the start page will be installed and used
---@field use_copilot boolean | nil If truthy, copilot will be installed and enabled

---@class NvimConfig
---@field lang_config NvimLanguageConfig | nil The nvim language config from `config.langs.lua`
---@field keymap_config NvimKeymapConfig | nil The nvim keymap config from `config.keys.lua`
---@field feature_config NvimFeatureConfig | nil The nvim keymap config from `config.keys.lua`

---@alias NvimBorder
---| "single"
---| "double"
---| "shadow"
---| "rounded"
---| "none"

-- ------------------------------
-- mini notify types
-- ------------------------------

---@alias MiniNotifyLevel
---| "ERROR"
---| "WARN"
---| "INFO"
---| "DEBUG"
---| "TRACE"
---| "OFF"

---@class MiniNotification
---@field msg string The message to be displayed
---@field level MiniNotifyLevel The level of the notification
---@field hl_group string The highlight group to be used
---@field ts_add number The timestamp of when the notification was added
---@field ts_update number The timestamp of the latest notification update
---@field ts_remove number | nil The timestamp of when the notification was removed

---@class MiniNotifyLevelOptions
---@field duration number The duration of the notification
---@field hl_group string The highlight group to be used

---@class MiniNotifyOptions
---@field ERROR MiniNotifyLevelOptions The options for the ERROR level
---@field WARN MiniNotifyLevelOptions The options for the WARN level
---@field INFO MiniNotifyLevelOptions The options for the INFO level
---@field DEBUG MiniNotifyLevelOptions The options for the DEBUG level
---@field TRACE MiniNotifyLevelOptions The options for the TRACE level
---@field OFF MiniNotifyLevelOptions The options for the OFF level

---@class MiniNotifyConfigWindowConfig
---@field border? string The window border
---@field zindex? number The window zindex
---@field width? number The window width
---@field height? number The window height

---@class MiniNotifyConfigWindow
---@field config? MiniNotifyConfigWindowConfig The window configuration
---@field border? NvimBorder The window border
---@field max_width_share? number The maximum width share of the window
---@field winblend? number The window winblend

---@class MiniNotifyConfigContent
---@field format? fun(notif: MiniNotification): string The function to format the notification message
---@field sort? fun(notifs: MiniNotification[]): MiniNotification[] The function to sort the notifications

---@class MiniNotifyConfigLspProgress
---@field enable? boolean Whether LSP progress should be shown in notifications
---@field duration_last? number The duration of the last progress report

---@class MiniNotifyConfig
---@field window? MiniNotifyConfigWindow The window configuration
---@field content? MiniNotifyConfigContent The content configuration
---@field lsp_progress? MiniNotifyConfigLspProgress The LSP progress configuration
