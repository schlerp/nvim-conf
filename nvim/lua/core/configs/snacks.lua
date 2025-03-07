local picker_config = require("core.configs.snacks_picker")
local notifier_config = require("core.configs.snacks_notifier")

require("snacks").setup(
    ---@type snacks.Config
    {
        bigfile = { enabled = true },
        dashboard = { enabled = false },
        explorer = { enabled = true, replace_netrw = true },
        image = { enabled = false },
        indent = { enabled = true },
        input = { enabled = false },
        picker = picker_config,
        notifier = notifier_config,
        quickfile = { enabled = true },
        scope = { enabled = true },
        scroll = { enabled = false },
        statuscolumn = { enabled = false },
        words = { enabled = true },
    }
)
