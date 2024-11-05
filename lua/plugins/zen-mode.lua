return {
	{
		"cdmill/focus.nvim",
		cmd = { "Focus", "Zen", "Narrow" },
		event = "VeryLazy",
		keys = {
			{ "<leader>mf", ":Focus<CR>", desc = "Focus: focus mode" },
			{ "<leader>mz", ":Zen<CR>", desc = "Focus: zen mode" },
			{ "<leader>mn", ":Narrow<CR>", mode = { "v", "n" }, desc = "Focus: narrow mode" },
		},
		opts = {},
	},
}
