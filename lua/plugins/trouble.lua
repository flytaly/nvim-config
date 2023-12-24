return {
	"folke/trouble.nvim",
	init = function()
		vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { desc = "Trouble: Toggle" })
		vim.keymap.set(
			"n",
			"<leader>xw",
			"<cmd>TroubleToggle workspace_diagnostics<cr>",
			{ desc = "Trouble: workspace diagnostics" }
		)
		vim.keymap.set(
			"n",
			"<leader>xd",
			"<cmd>TroubleToggle document_diagnostics<cr>",
			{ desc = "Trouble: document diagnostics" }
		)
		vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", { desc = "Trouble: quickfix" })
		vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", { desc = "Trouble: loclist" })
		vim.keymap.set("n", "gR", "<cmd>Trouble lsp_references<cr>", { desc = "Trouble: lsp_references" })
	end,
	config = function()
		require("trouble").setup({})
	end,
}
