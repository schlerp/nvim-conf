-- set defaults
require("core.set")

-- setup plugins
require("core.plugins")
require("core.configs.init")

-- setup lsp
require("core.lsp.init")
require("core.diagnostics")

-- setup keymaps
require("core.keymap")

-- setup terminal
require("core.terminal")
