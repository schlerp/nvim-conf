local lang_config = require("config.langs")
local utils = require("core.utils")
local M = {}

-- load the builtin langues that have been enabled
for _, value in ipairs(lang_config.enabled_langs) do
	local this_lang_config = utils.try_import_module("core.langs." .. value)
	if this_lang_config ~= nil then
		M[this_lang_config.lang_name] = this_lang_config
	end
end

-- load any custom language definitions
for _, value in ipairs(lang_config.custom_lang_defs) do
	M[value.lang_name] = value
end

return M
