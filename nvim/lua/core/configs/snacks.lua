require("snacks").setup(
    ---@type snacks.Config
    {
        bigfile = { enabled = true },
        dashboard = { enabled = false },
        explorer = { enabled = false },
        image = { enabled = false },
        indent = { enabled = true },
        input = { enabled = false },
        picker = { enabled = false },
        notifier = { enabled = false },
        quickfile = { enabled = true },
        scope = { enabled = true },
        scroll = { enabled = false },
        statuscolumn = { enabled = false },
        words = { enabled = true },
    }
)
