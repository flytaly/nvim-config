return {
	"kazhala/close-buffers.nvim",
	event = "VeryLazy",
	keys = {
		{ "<leader>Q", "<cmd>BDelete hidden<CR>", desc = "Close hidden Buffers" },
		{
			"<leader>q",
			"<cmd>bd<CR>", -- use bd to close current buffer and current tab
			desc = "Close current Buffer",
		},
	},
}
