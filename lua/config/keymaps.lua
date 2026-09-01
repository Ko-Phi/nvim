-- luacheck: globals vim
local keymap = vim.keymap

keymap.set("n", "x", '"_x"')
keymap.set("n", "$", "g_")

keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

keymap.set("n", "<leader>e", ":Neotree toggle=true<CR>")

keymap.set("x", '<leader>"', 'c""<Esc>P', { desc = 'Surround Selection in ""' })
keymap.set("x", "<leader>'", "c''<Esc>P", { desc = "Surround Selection in ''" })
keymap.set("x", "<leader>[", "c[]<Esc>P", { desc = "Surround Selection in []" })
keymap.set("x", "<leader>(", "c()<Esc>P", { desc = "Surround Selection in ()" })
keymap.set("x", "<leader>{", "c{}<Esc>P", { desc = "Surround Selection in {}" })

keymap.set("n", "gl", function()
	vim.diagnostic.open_float()
end)
