return {
	{ "neanias/everforest-nvim", lazy = false, priority = 1000 },
	{ "rebelot/kanagawa.nvim", lazy = false, priority = 1000 },
	{ "Verf/deepwhite.nvim", lazy = false, priority = 1000 },
	{ "typicode/bg.nvim", lazy = false },
	{
		"Shatur/neovim-ayu",
		init = function()
			require("ayu").setup({})
		end,
	},
	{ "sainnhe/gruvbox-material" },
}
