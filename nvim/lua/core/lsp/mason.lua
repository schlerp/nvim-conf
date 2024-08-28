local lang_configs = require("core.langs.init")

require("mason").setup({
    ui = {
        border = "rounded",
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
    log_level = vim.log.levels.WARN,
})

require("mason-lspconfig").setup({
    automatic_installation = true,
})

local function get_used_tools_for_mason()
    local ret = {}
    for _, config in pairs(lang_configs) do
        -- get the linters
        for _, x in ipairs(config.linters) do
            table.insert(ret, x)
        end

        -- get the formatters
        for _, x in ipairs(config.formatters) do
            table.insert(ret, x)
        end

        -- get the lsps
        for _, x in ipairs(config.lsp_servers) do
            table.insert(ret, x.lsp_name)
        end

        -- get the extra mason tools
        if config.extra_mason ~= nil then
            for _, x in ipairs(config.extra_mason) do
                table.insert(ret, x.lsp_name)
            end
        end
    end
    return ret
end

require("mason-tool-installer").setup({
    ensure_installed = get_used_tools_for_mason(),
    auto_update = true,
})
