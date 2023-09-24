---@type NvimConfig
local config = require("core.config") --- type: ignore
local utils = require("core.utils")
local M = {}

-- if the language config is nil then we will use the default (enable all)
if config.lang_config == nil then
    config.lang_config = {
        enabled_langs = {
            "lua",
            "python",
            "rust",
            "markdown",
            "svelte",
            "html",
            "typescript",
            "bash",
            "cpp",
            "dockerfile",
        },
        custom_lang_defs = {},
    }
end

-- load the builtin langues that have been enabled
for _, value in ipairs(config.lang_config.enabled_langs) do
    local this_lang_config = utils.try_import_module("core.langs." .. value)
    if this_lang_config ~= nil then M[this_lang_config.lang_name] = this_lang_config end
end

-- load any custom language definitions
for _, value in ipairs(config.lang_config.custom_lang_defs) do
    M[value.lang_name] = value
end

return M
