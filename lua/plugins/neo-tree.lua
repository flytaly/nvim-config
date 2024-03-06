return {
	{
		-- refactor on file rename/move with some LSP
		"antosha417/nvim-lsp-file-operations",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-neo-tree/neo-tree.nvim",
		},
		config = function()
			require("lsp-file-operations").setup()
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		keys = {
			{
				"<leader>no",
				function()
					require("neo-tree.command").execute({ toggle = true })
				end,
				desc = "NeoTree: toggle (cwd)",
			},
			{ "<leader>e", "<leader>no", desc = "NeoTree: toggle (cwd)", remap = true },
			{
				"<leader>nf",
				function()
					require("neo-tree.command").execute({ reveal = true })
				end,
				desc = "NeoTree: reveal file",
			},
			{
				"<leader>nb",
				function()
					require("neo-tree.command").execute({ source = "buffers", toggle = true })
				end,
				desc = "NeoTree: buffer explorer",
			},
			{
				"<leader>ng",
				function()
					require("neo-tree.command").execute({ source = "git_status", toggle = true })
				end,
				desc = "NeoTree: git explorer",
			},
		},
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
			--
		},
		config = function()
			require("neo-tree").setup()
		end,
	},
}
