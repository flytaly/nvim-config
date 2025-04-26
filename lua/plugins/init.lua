return {
	{ "kana/vim-textobj-entire", dependencies = { "kana/vim-textobj-user" } }, -- select entire buffer
	{ "nvim-lua/plenary.nvim" }, -- useful lua functions
	{ "unblevable/quick-scope" }, -- highlight unique chars
	{ "tpope/vim-sleuth" }, -- Detect tabstop and shiftwidth automatically
	{ "tpope/vim-rhubarb", event = "VeryLazy" },
	{ "tpope/vim-unimpaired" },
	{ "MagicDuck/grug-far.nvim", opts = {} }, -- search and replace
	{ "lambdalisue/suda.vim", event = "VeryLazy" },
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
	{ "nanotee/sqls.nvim", ft = "sql" },
	{ "m4xshen/autoclose.nvim", opts = { options = { disable_command_mode = true } } },
	{
		"hedyhli/outline.nvim",
		opts = {},
		keys = { { "<leader>xo", "<cmd>Outline<CR>", desc = "Symbols Outline" } },
	},
	-- { "Jay-Madden/auto-fix-return.nvim", ft = "go", config = true },
	{ "nvim-treesitter/nvim-treesitter-context", opts = { multiline_threshold = 4 } },
	{
		"gaelph/logsitter.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		keys = {
			{
				"<leader>lg",
				function() require("logsitter").log() end,
				mode = { "n" },
				desc = "Logsitter: log current",
			},
		},
		config = function()
			require("logsitter").setup({
				path_format = "fileonly",
				prefix = "[LS]",
				separator = ">",
			})
		end,
	},
}
