local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Set menu
dashboard.section.buttons.val = {
    dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("f", "  > Find file", ":Telescope find_files<CR>"),
    dashboard.button("g", "  > Find string", ":Telescope live_grep<CR>"),
    dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
    dashboard.button("q", "  > Quit NVIM", ":qa<CR>"),
}

local v = vim.version()
local version = "  v" .. v.major .. "." .. v.minor .. "." .. v.patch

vim.api.nvim_create_autocmd("User", {
    pattern = "LazyVimStarted",
    callback = function()
        local stats = require("lazy").stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        dashboard.section.footer.val = {
            "",
            version
                .. " ( "
                .. stats.loaded
                .. "/"
                .. stats.count
                .. ", 󰖉 "
                .. ms
                .. "ms)",
        }
        pcall(vim.cmd.AlphaRedraw)
    end,
})

dashboard.section.footer.val = {}

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
