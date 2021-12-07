require("hop").setup({
	keys = "etovxqpdygfblzhckisuran",
	jump_on_sole_occurrence = true,
})
map("n", "s", "<cmd>HopChar2<CR>")
map("n", "<Leader>j", "<cmd>HopLineStartAC<CR>")
map("n", "<Leader>k", "<cmd>HopLineStartBC<CR>")
