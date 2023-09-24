vim.notify = require("notify")

vim.notify.setup()

vim.lsp.handlers["window/showMessage"] = function(_, result, ctx)
    local client = vim.lsp.get_client_by_id(ctx.client_id)
    local lvl = ({
        "ERROR",
        "WARN",
        "INFO",
        "DEBUG",
    })[result.type]
    vim.notify({ result.message }, lvl, {
        title = "LSP | " .. client.name,
        timeout = 5000,
        keep = function() return lvl == "ERROR" or lvl == "WARN" end,
    })
end
