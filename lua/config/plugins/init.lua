-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	use({
		"kana/vim-textobj-entire",
		requires = { { "kana/vim-textobj-user" } }, -- create your own text objects
	}) -- select entire buffer
	-- use("vim-scripts/restore_view.vim")
	use("nvim-lua/plenary.nvim") -- useful lua functions
	use("unblevable/quick-scope") -- highlight unique chars
	use("nvim-lua/popup.nvim")
	use("tpope/vim-fugitive")
	use("machakann/vim-sandwich") -- vim surround alternative
	use({
		"folke/which-key.nvim",
		config = function()
			require("config.plugins.which-key")
		end,
	})
	use({
		"luukvbaal/stabilize.nvim",
		config = function()
			require("stabilize").setup()
		end,
	})

	use({
		"sindrets/diffview.nvim",
		config = function()
			require("config.plugins.diffview")
		end,
	})

	use({ -- maximize and restore windows
		"szw/vim-maximizer",
		config = function()
			require("config.plugins.vim-maximizer")
		end,
	})

	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	})

	use({
		"nvim-lualine/lualine.nvim",
		config = function()
			require("config.plugins.lualine")
		end,
	})

	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
		config = function()
			require("config.plugins.telescope")
		end,
	})

	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

	use({ "nvim-telescope/telescope-file-browser.nvim" })

	use({
		"phaazon/hop.nvim", -- easy-motion alternative
		config = function()
			require("config.plugins.hop")
		end,
	})

	use({
		"luukvbaal/nnn.nvim",
		config = function()
			require("config.plugins.nnn")
		end,
	})

	use({
		"lyokha/vim-xkbswitch", --- switch from RU -> EN automatically
		config = function()
			require("config.plugins.vim-xkbswitch")
		end,
	})

	use({
		"akinsho/toggleterm.nvim",
		config = function()
			require("config.plugins.toggleterm")
		end,
	})

	-- consistent navigation between vim and terminal splits
	use({ "knubie/vim-kitty-navigator", run = "cp ./*.py ~/.config/kitty/" })

	------- Themes and styles
	-- use 'shaunsingh/nord.nvim'
	use("kyazdani42/nvim-web-devicons")
	use("folke/tokyonight.nvim")
	use("rebelot/kanagawa.nvim")
	use("JoosepAlviste/palenightfall.nvim")

	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			local conf = {
				RGB = true, -- #RGB hex codes
				RRGGBB = true, -- #RRGGBB hex codes
				names = true, -- "Name" codes like Blue
				RRGGBBAA = true, -- #RRGGBBAA hex codes
				rgb_fn = true, -- CSS rgb() and rgba() functions
				hsl_fn = true, -- CSS hsl() and hsla() functions
				css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
				css_fn = true,
			}
			require("colorizer").setup({ "svelte", "html", "css" }, conf)
		end,
	})

	use({
		"folke/zen-mode.nvim",
		config = function()
			require("config.plugins.zen-mode")
		end,
	})

	-------------------------
	------- Programming utils
	use("sheerun/vim-polyglot")
	-- use 'evanleck/vim-svelte'
	use({
		"leafOfTree/vim-svelte-plugin",
		requires = "leafgarland/typescript-vim",
		config = function()
			vim.g.vim_svelte_plugin_use_typescript = 1
		end,
	})

	-- Comments
	use({ "JoosepAlviste/nvim-ts-context-commentstring" })
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("config.plugins.comment")
		end,
	})

	use("mhartington/formatter.nvim")
	use("jose-elias-alvarez/nvim-lsp-ts-utils")
	use("jose-elias-alvarez/null-ls.nvim")

	use("neovim/nvim-lspconfig")
	use("williamboman/nvim-lsp-installer")

	use({ -- show function signature when you type
		"ray-x/lsp_signature.nvim",
		config = function()
			require("config.plugins.lsp_signature")
		end,
	})

	-- use("nvim-lua/lsp-status.nvim") -- generate statusline components from the LSP client.

	use({ -- a code outline window for skimming and quick navigation
		"stevearc/aerial.nvim",
		config = function()
			require("config.plugins.aerial-nvim")
		end,
	})

	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("config.plugins.trouble")
		end,
	})

	use({
		"vuki656/package-info.nvim",
		requires = "MunifTanjim/nui.nvim",
		config = function()
			require("config.plugins.package-info")
		end,
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			vim.cmd([[TSUpdate]])
		end,
		config = function()
			require("config.plugins.treesitter")
		end,
	})
	use({ "RRethy/nvim-treesitter-textsubjects" })
	use({ "nvim-treesitter/nvim-treesitter-textobjects" })

	use({ "weilbith/nvim-code-action-menu" })

	---- Completion and Snippets
	use("onsails/lspkind-nvim")
	use({
		"hrsh7th/nvim-cmp",
		config = function()
			require("config.plugins.nvim-cmp")
		end,
	})
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-buffer" })
	use({ "hrsh7th/cmp-path" })
	use({ "hrsh7th/cmp-cmdline" })
	use({ "hrsh7th/cmp-nvim-lua" })
	use({ "saadparwaiz1/cmp_luasnip" })
	use({
		"L3MON4D3/LuaSnip",
		requires = {
			"rafamadriz/friendly-snippets",
			"fivethree-team/vscode-svelte-snippets",
			{
				"dsznajder/vscode-es7-javascript-react-snippets",
				run = "yarn install --frozen-lockfile && yarn compile",
			},
		},
		config = function()
			require("config.plugins.snippets")
		end,
	})

	use({
		"windwp/nvim-autopairs",
		after = "nvim-cmp",
		config = function()
			require("nvim-autopairs").setup()
		end,
	})

	-- debug
	use("mfussenegger/nvim-dap")
	use("nvim-telescope/telescope-dap.nvim")
	use({
		"theHamsta/nvim-dap-virtual-text",
		config = function()
			require("nvim-dap-virtual-text").setup()
		end,
	})

	use({
		"david-kunz/jester",
		config = function()
			require("config.plugins.jester")
		end,
	})

	--
	use({
		"vim-test/vim-test",
		config = function()
			require("config.plugins.vim-test")
		end,
	})

	-- markdown
	use({
		"ekickx/clipboard-image.nvim",
		config = function()
			require("config.plugins.clipboard-image")
		end,
	})

	use({ "iamcco/markdown-preview.nvim", run = "cd app && yarn install" })

	use({ "nanotee/sqls.nvim", ft = "sql" })

	use({
		"anuvyklack/pretty-fold.nvim",
		config = function()
			require("pretty-fold").setup({})
			require("pretty-fold.preview").setup_keybinding()
		end,
	})

	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup()
		end,
	})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
