require("hop").setup({
	jump_on_sole_occurrence = true,
})
map("n", "<Leader>w", "<cmd>HopChar2<CR>")
map("n", "<Leader>j", "<cmd>HopLineStartAC<CR>")
map("n", "<Leader>k", "<cmd>HopLineStartBC<CR>")
