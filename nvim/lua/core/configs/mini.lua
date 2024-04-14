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
