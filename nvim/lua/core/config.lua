local utils = require("core.utils")

local config = {}

config.lang_config = utils.try_import_module("config.lang_config")

return config
