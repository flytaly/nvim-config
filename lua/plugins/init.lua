return {
	{ "kana/vim-textobj-entire", dependencies = { "kana/vim-textobj-user" } }, -- select entire buffer
	{ "nvim-lua/plenary.nvim" }, -- useful lua functions
	{ "unblevable/quick-scope" }, -- highlight unique chars
	{ "tpope/vim-sleuth" }, -- Detect tabstop and shiftwidth automatically
	{ "tpope/vim-rhubarb", event = "VeryLazy" },
	{ "tpope/vim-unimpaired" },
	{ "nvim-pack/nvim-spectre", event = "VeryLazy" },
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
		"simrat39/symbols-outline.nvim",
		opts = {
			highlight_hovered_item = true,
			--[[ symbol_blacklist = { "Variable", "Constant", "Key", "Property" }, ]]
			autofold_depth = 3,
		},
		keys = { { "<leader>xo", "<cmd>SymbolsOutline<CR>", desc = "Symbols Outline" } },
	},
	-- { "Jay-Madden/auto-fix-return.nvim", ft = "go", config = true },
	{ "nvim-treesitter/nvim-treesitter-context", opts = { multiline_threshold = 4 } },
	{
		"gaelph/logsitter.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		keys = {
			{
				"<leader>lg",
				function()
					require("logsitter").log()
				end,
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
	{
		"f-person/auto-dark-mode.nvim",
		config = function()
			local auto_dark_mode = require("auto-dark-mode")
			auto_dark_mode.setup({
				set_dark_mode = function()
					vim.api.nvim_set_option_value("background", "dark", {})
					require("config.theme").apply("dark")
				end,
				set_light_mode = function()
					vim.api.nvim_set_option_value("background", "light", {})
					require("config.theme").apply("light")
				end,
				update_interval = 3000,
				fallback = "dark",
			})
			-- don't listen for changes
			auto_dark_mode.disable()
		end,
	},
}
