return {
	{
		"iamcco/markdown-preview.nvim",
		build = "cd app && yarn install",
		ft = "markdown",
		keys = { { "<leader>zp", ft = "markdown", ":MarkdownPreviewToggle<CR>", desc = "Markdown Preview: toggle" } },
		init = function()
			vim.g.mkdp_auto_close = 0
			vim.g.mkdp_browser = "firefox"
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
		ft = "markdown",
		keys = { { "<leader>zm", ft = "markdown", "<cmd>Markview toggle<cr>", desc = "Markview: toggle" } },
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},
}
