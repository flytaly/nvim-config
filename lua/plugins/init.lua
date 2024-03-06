return {
	{ "kana/vim-textobj-entire", dependencies = { "kana/vim-textobj-user" } }, -- select entire buffer
	{ "vim-scripts/restore_view.vim" },
	{ "nvim-lua/plenary.nvim" }, -- useful lua functions
	{ "unblevable/quick-scope" }, -- highlight unique chars
	{ "nvim-lua/popup.nvim" },
	{ "tpope/vim-sleuth" }, -- Detect tabstop and shiftwidth automatically
	{ "tpope/vim-fugitive", event = "VeryLazy", keys = { { "<leader>hg", "<cmd>Git<cr>", desc = "Open Git" } } },
	{ "tpope/vim-rhubarb", event = "VeryLazy" },
	{ "tpope/vim-unimpaired" },
	{ "tpope/vim-dadbod", event = "VeryLazy" },
	{
		"kristijanhusak/vim-dadbod-ui",
		config = function()
			vim.g.db_ui_save_location = "~/Dropbox/db_ui_queries"
		end,
	},
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

	{ "natecraddock/workspaces.nvim", opts = { hooks = { open = { "NvimTreeOpen" } } } },
	{
		"gabrielpoca/replacer.nvim",
		keys = {
			{
				"<leader>gr",
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
	{ "nvim-tree/nvim-web-devicons" },
	{ "neanias/everforest-nvim" },
	{ "rebelot/kanagawa.nvim" },
	{ "Verf/deepwhite.nvim", lazy = false, priority = 1000 },
	{ "typicode/bg.nvim", lazy = false },
	{
		"Shatur/neovim-ayu",
		init = function()
			require("ayu").setup({})
		end,
	},
	{ "sam4llis/nvim-tundra" },
	{ "lukas-reineke/indent-blankline.nvim" }, -- indentation guides
	{ "nanotee/sqls.nvim", ft = "sql" },
	{ "weilbith/nvim-code-action-menu" },
	{
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},
	{ "nvim-lua/lsp-status.nvim" }, -- generate statusline components from the LSP client.
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
	{ "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap" } },
	{ "theHamsta/nvim-dap-virtual-text", config = true },
	{ "leoluz/nvim-dap-go" },
	{ "mxsdev/nvim-dap-vscode-js", dependencies = { "mfussenegger/nvim-dap" } },
	{
		"microsoft/vscode-js-debug",
		opt = true,
		build = "npm install --legacy-peer-deps && npm run compile",
	},
	{ "preservim/vim-markdown" },
	{ "sophacles/vim-processing" },
}
