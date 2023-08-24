---@class LspServerDefinition
---@field lsp_name string The name of the lsp server to setup
---@field lsp_settings table The config to be passed into lsp server setup function

---@class LanguageDefinition
---@field lang_name string The name of this language, eg. "lua"
---@field formatters function[] An array of functions that initialise formatters
---@field linters string[] An array of linter names (strings)
---@field lsp_servers LspServerDefinition[] An array of LspServerDefinitions
