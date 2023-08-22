require("telescope").setup({})

vim.lsp.handlers["textDocument/references"] = require("telescope.builtin").lsp_reference
