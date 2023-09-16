-- easy-motion alternative
return {
	"phaazon/hop.nvim",
	opts = { jump_on_sole_occurrence = true },
	init = function()
		vim.keymap.set("n", "<Leader>w", "<cmd>HopChar1<CR>", { desc = "Hop to character" })
		vim.keymap.set("n", "<Leader>j", "<cmd>HopLineStartAC<CR>", { desc = "Hop to line above" })
		vim.keymap.set("n", "<Leader>k", "<cmd>HopLineStartBC<CR>", { desc = "Hop to line below" })
	end,
}
