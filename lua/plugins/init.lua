return {
	{ "kana/vim-textobj-entire", dependencies = { "kana/vim-textobj-user" } }, -- select entire buffer
	{ "vim-scripts/restore_view.vim" },
	{ "nvim-lua/plenary.nvim" }, -- useful lua functions
	{ "unblevable/quick-scope" }, -- highlight unique chars
	{ "nvim-lua/popup.nvim" },
	{ "tpope/vim-sleuth" }, -- Detect tabstop and shiftwidth automatically
	{ "tpope/vim-fugitive", event = "VeryLazy", keys = { { "<leader>gg", "<cmd>Git<cr>", desc = "Open Git" } } },
	{ "tpope/vim-rhubarb", event = "VeryLazy" },
	{ "tpope/vim-unimpaired" },
	{ "tpope/vim-dadbod", event = "VeryLazy" },
	{
		"kristijanhusak/vim-dadbod-ui",
		config = function()
			vim.g.db_ui_save_location = "~/Dropbox/db_ui_queries"
		end,
	},
	{ "nvim-pack/nvim-spectre", event = "VeryLazy" },
	-- { "machakann/vim-sandwich" }, -- vim surround alternative
	{ "mg979/vim-visual-multi" },
	{ "lambdalisue/suda.vim", event = "VeryLazy" },
	{
		"sindrets/diffview.nvim",
		event = "VeryLazy",
		opts = { file_panel = { win_config = { position = "left" } } },
	},
	{
		"szw/vim-maximizer",
		event = "VeryLazy",
		keys = { { "<leader>mm", "<cmd>MaximizerToggle<cr>", desc = "Maximize current window" } },
	},
	--- kitty
	{ "knubie/vim-kitty-navigator", build = "cp ./*.py ~/.config/kitty/" }, -- consistent navigation between vim and terminal splits
	{ "fladson/vim-kitty" }, -- syntax highlighting for Kitty config
	--[[ { "shaun-mathew/Chameleon.nvim", config = true }, -- change kitty background to match neovim theme ]]

	{ "natecraddock/workspaces.nvim", opts = { hooks = { open = { "Neotree" } } } },
	{
		"gabrielpoca/replacer.nvim",
		keys = {
			{
				"<leader>ar",
				"<cmd>lua require('replacer').run()<cr>",
				desc = "Replace in quickfix window",
				silent = true,
			},
		},
	},
	{
		"mbbill/undotree",
		event = "VeryLazy",
		keys = { { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Undotree: toggle" } },
	},
	{ "lukas-reineke/indent-blankline.nvim" }, -- indentation guides
	{ "nanotee/sqls.nvim", ft = "sql" },
	{ "ThePrimeagen/refactoring.nvim", config = true },
	{ "m4xshen/autoclose.nvim", opts = { {} } },
	{
		"simrat39/symbols-outline.nvim",
		opts = {
			highlight_hovered_item = true,
			--[[ symbol_blacklist = { "Variable", "Constant", "Key", "Property" }, ]]
			autofold_depth = 3,
		},
		keys = { { "<leader>xo", "<cmd>SymbolsOutline<CR>", desc = "Symbols Outline" } },
	},
	{ "mfussenegger/nvim-dap" },
	{ "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },
	{ "theHamsta/nvim-dap-virtual-text", config = true },
	{ "leoluz/nvim-dap-go" },
	{ "mxsdev/nvim-dap-vscode-js", dependencies = { "mfussenegger/nvim-dap" } },
	{
		"microsoft/vscode-js-debug",
		opt = true,
		build = "npm install --legacy-peer-deps && npm run compile",
	},
	{ "preservim/vim-markdown" },
	{
		"MeanderingProgrammer/markdown.nvim",
		name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("render-markdown").setup({})
		end,
	},
	{ "sophacles/vim-processing" },
}
