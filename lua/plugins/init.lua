return {
	{ "kana/vim-textobj-entire", dependencies = { "kana/vim-textobj-user" } }, -- select entire buffer
	{ "vim-scripts/restore_view.vim" },
	{ "nvim-lua/plenary.nvim" }, -- useful lua functions
	{ "unblevable/quick-scope" }, -- highlight unique chars
	{ "nvim-lua/popup.nvim" },
	{ "tpope/vim-fugitive", keys = { { "<leader>hg", "<cmd>Git<cr>", desc = "Open Git" } } },
	{ "tpope/vim-rhubarb" },
	{ "tpope/vim-unimpaired" },
	{ "tpope/vim-dadbod" },
	{
		"kristijanhusak/vim-dadbod-ui",
		config = function()
			vim.g.db_ui_save_location = "~/Dropbox/db_ui_queries"
		end,
	},
	{ "machakann/vim-sandwich" }, -- vim surround alternative
	{ "mg979/vim-visual-multi" },
	{ "lambdalisue/suda.vim" },
	{
		"sindrets/diffview.nvim",
		opts = { file_panel = { win_config = { position = "left" } } },
	},
	{
		"szw/vim-maximizer",
		keys = { { "<leader>mm", "<cmd>MaximizerToggle<cr>", desc = "Maximize current window" } },
	},
	{
		"famiu/feline.nvim",
		config = function()
			require("plugins.feline.feline")
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		keys = {
			{ "<leader>no", "<cmd>NvimTreeToggle<cr>", desc = "NvimTree: toggle" },
			{ "<leader>nf", "<cmd>NvimTreeFindFile<cr>", desc = "NvimTree: find current file" },
		},
		config = true,
	},
	{
		-- refactor on file rename/move in nvim-tree with some LSP
		"antosha417/nvim-lsp-file-operations",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-tree.lua" },
		config = true,
	},

	--- kitty
	{ "knubie/vim-kitty-navigator", build = "cp ./*.py ~/.config/kitty/" }, -- consistent navigation between vim and terminal splits
	{ "fladson/vim-kitty" }, -- syntax highlighting for Kitty config
	--[[ { "shaun-mathew/Chameleon.nvim", config = true }, -- change kitty background to match neovim theme ]]

	{ "natecraddock/workspaces.nvim", opts = { hooks = { open = { "NvimTreeOpen", "Telescope find_files" } } } },
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
	{ "mbbill/undotree", keys = { { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Undotree: toggle" } } },
	{ "nvim-tree/nvim-web-devicons" },
	{ "neanias/everforest-nvim" },
	{ "Verf/deepwhite.nvim", lazy = false, priority = 1000 },
	{
		"Shatur/neovim-ayu",
		init = function()
			require("ayu").setup({})
		end,
	},
	{ "sam4llis/nvim-tundra" },
	{ "lukas-reineke/indent-blankline.nvim" }, -- indentation guides
	{ "RishabhRD/nvim-cheat.sh", dependencies = "RishabhRD/popfix" },
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
	{ "folke/todo-comments.nvim", dependencies = "nvim-lua/plenary.nvim", config = true },
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
