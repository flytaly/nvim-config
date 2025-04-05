return {
	"folke/trouble.nvim",
	init = function()
		vim.keymap.set("n", "<leader>xx", "<cmd>Trouble<cr>", { desc = "Trouble: Toggle" })
		vim.keymap.set("n", "<leader>xw", "<cmd>Trouble diagnostics<cr>", { desc = "Trouble: diagnostics" })
		vim.keymap.set("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", { desc = "Trouble: quickfix" })
		vim.keymap.set("n", "<leader>xl", "<cmd>Trouble loclist<cr>", { desc = "Trouble: loclist" })
		vim.keymap.set("n", "gR", "<cmd>Trouble lsp_references<cr>", { desc = "Trouble: lsp_references" })
	end,
	config = function() require("trouble").setup({}) end,
}
