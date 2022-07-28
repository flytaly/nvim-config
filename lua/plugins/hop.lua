require("hop").setup({
	jump_on_sole_occurrence = true,
})
vim.keymap.set("n", "<Leader>w", "<cmd>HopChar1<CR>")
vim.keymap.set("n", "<Leader>j", "<cmd>HopLineStartAC<CR>")
vim.keymap.set("n", "<Leader>k", "<cmd>HopLineStartBC<CR>")
