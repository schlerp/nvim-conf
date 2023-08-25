local keymap = vim.keymap
local cmd = vim.cmd
local api = vim.api

-- telescope
keymap.set("n", "<leader>fg", function()
	require("telescope.builtin").live_grep()
end)
keymap.set("n", "<leader>ff", function()
	require("telescope.builtin").find_files()
end)
keymap.set("n", "<leader>fF", function()
	require("telescope.builtin").git_files()
end)
keymap.set("n", "<leader>fb", function()
	require("telescope.builtin").buffers()
end)
keymap.set("n", "<leader>fh", function()
	require("telescope.builtin").help_tags()
end)

-- terminal (toggle term) keymaps
function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
	keymap.set("t", "jk", [[<C-\><C-n>]], opts)
	keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
	keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
	keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
	keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

-- nvim trees
keymap.set("n", "<leader>ft", function()
	local nvim_tree_api = require("nvim-tree.api")
	nvim_tree_api.tree.toggle({
		find_file = false,
		focus = true,
		update_root = false,
	})
end)
