return {
	"vim-test/vim-test",
	init = function()
		vim.keymap.set("n", "<Leader>tn", ":TestNearest<CR>", { silent = true })
		vim.keymap.set("n", "<Leader>tf", ":TestFile<CR>", { silent = true })
		vim.keymap.set("n", "<Leader>ts", ":TestSuite<CR>", { silent = true })
		vim.keymap.set("n", "<Leader>tl", ":TestLast<CR>", { silent = true })
		vim.keymap.set("n", "<Leader>tg", ":TestVisit<CR>", { silent = true })

		vim.g["test#strategy"] = "neovim"
		vim.g["test#go#gotest#options"] = "-tags=unittest"
	end,
}
