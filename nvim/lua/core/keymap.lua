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
