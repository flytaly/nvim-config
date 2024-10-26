return {
	-- { "tpope/vim-fugitive", event = "VeryLazy", keys = { { "<leader>gg", "<cmd>Git<cr>", desc = "Open Git" } } },
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration
			"nvim-telescope/telescope.nvim", -- optional
		},
		config = true,
		keys = { { "<leader>gg", "<cmd>Neogit<cr>", desc = "Open Git" } },
	},
	{
		"sindrets/diffview.nvim",
		event = "VeryLazy",
		opts = { file_panel = { win_config = { position = "left" } } },
	},
}
