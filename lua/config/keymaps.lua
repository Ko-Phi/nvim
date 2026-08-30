-- luacheck: globals vim
local keymap = vim.keymap
keymap.set("i", "jk", "<ESC>")
keymap.set("n", "x", '"_x"')

keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

keymap.set("n", "<leader>e", ":Neotree toggle=true<CR>")

keymap.set("n", "gl", function()
	vim.diagnostic.open_float()
end)
