return {
	{ "kana/vim-textobj-entire", dependencies = { "kana/vim-textobj-user" } }, -- select entire buffer
	{ "vim-scripts/restore_view.vim" },
	{ "nvim-lua/plenary.nvim" }, -- useful lua functions
	{ "unblevable/quick-scope" }, -- highlight unique chars
	{ "tpope/vim-sleuth" }, -- Detect tabstop and shiftwidth automatically
	{ "tpope/vim-fugitive", event = "VeryLazy", keys = { { "<leader>gg", "<cmd>Git<cr>", desc = "Open Git" } } },
	{ "tpope/vim-rhubarb", event = "VeryLazy" },
	{ "tpope/vim-unimpaired" },
	{ "nvim-pack/nvim-spectre", event = "VeryLazy" },
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
	-- { "knubie/vim-kitty-navigator", build = "cp ./*.py ~/.config/kitty/" }, -- consistent navigation between vim and terminal splits
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
	{ "lukas-reineke/indent-blankline.nvim" }, -- indentation guides
	{ "nanotee/sqls.nvim", ft = "sql" },
	{ "ThePrimeagen/refactoring.nvim", config = true },
	{ "m4xshen/autoclose.nvim", opts = { options = { disable_command_mode = true } } },
	{
		"simrat39/symbols-outline.nvim",
		opts = {
			highlight_hovered_item = true,
			--[[ symbol_blacklist = { "Variable", "Constant", "Key", "Property" }, ]]
			autofold_depth = 3,
		},
		keys = { { "<leader>xo", "<cmd>SymbolsOutline<CR>", desc = "Symbols Outline" } },
	},
	{ "mfussenegger/nvim-dap", event = "VeryLazy" },
	{ "rcarriga/nvim-dap-ui", event = "VeryLazy", dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },
	{ "theHamsta/nvim-dap-virtual-text", event = "VeryLazy", config = true },
	{ "leoluz/nvim-dap-go", event = "VeryLazy" },
	{ "mxsdev/nvim-dap-vscode-js", event = "VeryLazy", dependencies = { "mfussenegger/nvim-dap" } },
	{
		"microsoft/vscode-js-debug",
		opt = true,
		build = "npm install --legacy-peer-deps && npm run compile",
		event = "VeryLazy",
	},
	{ "Jay-Madden/auto-fix-return.nvim", ft = "go", config = true },
	{ "sophacles/vim-processing" },
	{ "nvim-treesitter/nvim-treesitter-context", opts = { multiline_threshold = 4 } },
}
