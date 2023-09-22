local utils = require("core.utils")

---@type NvimConfig
local config = {}

config.lang_config = utils.try_import_module("config.langs")
config.keymap_config = utils.try_import_module("config.keys")

return config
