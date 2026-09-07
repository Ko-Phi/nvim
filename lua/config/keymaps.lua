-- luacheck: globals vim
local keymap = vim.keymap

keymap.set({ "n", "v" }, "x", '"_x"')
keymap.set({ "n", "v" }, "$", "g_")

keymap.set({ "n", "v" }, "j", "gj")
keymap.set({ "n", "v" }, "k", "gk")

keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

keymap.set("n", "<leader>e", ":Neotree toggle=true<CR>")
keymap.set("n", "<leader>p", ":TypstPreviewToggle<CR>")

keymap.set("x", '<leader>"', 'c""<Esc>P', { desc = 'Surround Selection in ""' })
keymap.set("x", "<leader>'", "c''<Esc>P", { desc = "Surround Selection in ''" })
keymap.set("x", "<leader>[", "c[]<Esc>P", { desc = "Surround Selection in []" })
keymap.set("x", "<leader>(", "c()<Esc>P", { desc = "Surround Selection in ()" })
keymap.set("x", "<leader>{", "c{}<Esc>P", { desc = "Surround Selection in {}" })

keymap.set("n", "gl", function()
	vim.diagnostic.open_float()
end)
