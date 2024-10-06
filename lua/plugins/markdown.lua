return {
	{
		"iamcco/markdown-preview.nvim",
		build = "cd app && yarn install",
		ft = "markdown",
		init = function()
			vim.g.mkdp_auto_close = 0
			vim.g.mkdp_browser = "firefox"

			vim.keymap.set("n", "<leader>zp", ":MarkdownPreviewToggle<CR>")
		end,
	},
	--[[ {
		"MeanderingProgrammer/markdown.nvim",
		name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("render-markdown").setup({})
		end,
	}, ]]
	{
		"OXY2DEV/markview.nvim",
		lazy = false, -- Recommended
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},
}
