-- improved a/i text objects
local mini_ai = require("mini.ai")
mini_ai.setup()

-- surrounds manipulation
local mini_surround = require("mini.surround")
mini_surround.setup()

-- comment manipulation
local mini_comment = require("mini.comment")
mini_comment.setup()

-- indent scope
local mini_indent = require("mini.indentscope")
mini_indent.setup({
    draw = {
        delay = 100,
        animation = function() return 0 end,
    },
    symbol = "▏",
})

-- notifications
local mini_notify = require("mini.notify")

---Format the notification message for display
---@param notif MiniNotification
---@return string
local function notify_format(notif)
    local icon = "   "
    if notif.level == "ERROR" then
        icon = "  "
    elseif notif.level == "WARN" then
        icon = "  "
    elseif notif.level == "INFO" then
        icon = "  "
    elseif notif.level == "DEBUG" then
        icon = "  "
    elseif notif.level == "TRACE" then
        icon = "  "
    end

    return string.format("%s %s", icon, notif.msg)
end

---@type MiniNotifyConfig
local notify_setup_settings = {
    window = {
        config = {
            border = "rounded",
        },
        winblend = 30,
    },
    content = {
        format = notify_format,
    },
}

mini_notify.setup(notify_setup_settings)

---@type MiniNotifyOptions
local mini_notify_opts = {
    ERROR = { duration = 7000, hl_group = "DiagnosticError" },
    WARN = { duration = 5000, hl_group = "DiagnosticWarn" },
    INFO = { duration = 5000, hl_group = "DiagnosticInfo" },
    DEBUG = { duration = 0, hl_group = "DiagnosticHint" },
    TRACE = { duration = 0, hl_group = "DiagnosticOk" },
    OFF = { duration = 0, hl_group = "MiniNotifyNormal" },
}
vim.notify = mini_notify.make_notify(mini_notify_opts)
