require("neodev").setup({
    override = function(root_dir, library)
        if root_dir:match("nvim-conf") then
            library.enabled = true
            library.plugins = true
        end
    end,
})
