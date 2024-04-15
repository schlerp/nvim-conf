require("neodev").setup({
    override = function(root_dir, library)
        print(root_dir)
        if root_dir:match("nvim-conf", 1, true) == 1 then
            print(root_dir)
            library.enabled = true
            library.plugins = true
        end
    end,
})
