local utils = require("core.utils")

---@type NvimFeatureConfig
local M = {
    use_copilot = true,
    use_scrollbars = true,
    use_start_page = true,
    use_kraken = utils.get_env_bool("USE_KRAKEN", false),
}

return M
