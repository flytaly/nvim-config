return {
	"kazhala/close-buffers.nvim",
	event = "VeryLazy",
	keys = {
		{ "<leader>Q", "<cmd>BDelete hidden<CR>", desc = "Close hidden Buffers" },
		{
			"<leader>q",
			":bd<CR>:bnext<CR>", -- use bd to close current buffer and current tab, then go to the next
			desc = "Close current Buffer",
			{ noremap = true, silent = true },
		},
	},
}
