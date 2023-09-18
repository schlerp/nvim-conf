local utils = require("core.utils")

---@type NvimConfig
local config = {}

config.lang_config = utils.try_import_module("config.lang_config")

return config
