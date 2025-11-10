local picker_config = require("core.configs.snacks_picker")
local notifier_config = require("core.configs.snacks_notifier")
local gh_config = require("core.configs.snacks_gh")

require("snacks").setup(
    ---@type snacks.Config
    {
        bigfile = { enabled = true },
        dashboard = { enabled = false },
        explorer = { enabled = false, replace_netrw = false },
        gh = gh_config,
        image = { enabled = false },
        indent = { enabled = true },
        input = { enabled = false },
        gitbrowse = { enabled = true },
        picker = picker_config,
        notifier = notifier_config,
        quickfile = { enabled = true },
        scope = { enabled = true },
        scroll = { enabled = false },
        statuscolumn = { enabled = false },
        words = { enabled = true },
    }
)
