require("config.packer-install")

local packer_present, packer = pcall(require, "packer")
if not packer_present then
	print("packer isn't installed")
	return
end

return packer.startup(function(use)
	use({ "wbthomason/packer.nvim" })
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
	use("tpope/vim-unimpaired")
	use("nathom/filetype.nvim")

	use({ "mg979/vim-visual-multi" })

	use({ "lambdalisue/suda.vim" })

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
		"sidebar-nvim/sidebar.nvim",
		config = function()
			require("config.plugins.sidebar")
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

	use({ "https://github.com/moll/vim-bbye" })

	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("config.plugins.gitsigns")
		end,
	})

	use({
		"feline-nvim/feline.nvim",
		config = function()
			require("config.plugins.statusline.feline")
		end,
	})

	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
		config = function()
			require("config.plugins.telescope")
		end,
	})

	use({ "nvim-telescope/telescope-ui-select.nvim" })

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
		"kyazdani42/nvim-tree.lua",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("config.plugins.nvim-tree")
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

	use("fladson/vim-kitty")

	------- Themes and styles
	-- use 'shaunsingh/nord.nvim'
	use("kyazdani42/nvim-web-devicons")
	use("folke/tokyonight.nvim")

	use({
		"catppuccin/nvim",
		as = "catppuccin",
		config = function()
			require("config.plugins.catppuccin")
		end,
	})

	use("rmehri01/onenord.nvim")
	use("rebelot/kanagawa.nvim")
	use("sainnhe/everforest")

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
			require("colorizer").setup({ "svelte", "html", "css", "conf", "lua" }, conf)
		end,
	})

	use("lukas-reineke/indent-blankline.nvim")

	use({
		"folke/zen-mode.nvim",
		config = function()
			require("config.plugins.zen-mode")
		end,
	})

	use({
		"stevearc/dressing.nvim",
		config = function()
			require("config.plugins.nvim-dressing")
		end,
	})

	use({
		"rcarriga/nvim-notify",
		config = function()
			vim.notify = require("notify")
		end,
	})

	-------------------------
	------- Programming utils
	use({ "fatih/vim-go" })

	-- Comments
	use({ "JoosepAlviste/nvim-ts-context-commentstring" })
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("config.plugins.comment")
		end,
	})

	use("mhartington/formatter.nvim")

	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	})

	use("jose-elias-alvarez/typescript.nvim")
	use("jose-elias-alvarez/null-ls.nvim")

	use("AndrewRadev/splitjoin.vim")

	use({
		"ThePrimeagen/refactoring.nvim",
		requires = { { "nvim-lua/plenary.nvim" }, { "nvim-treesitter/nvim-treesitter" } },
		config = function()
			require("refactoring").setup({})
		end,
	})

	use({
		"nanozuki/tabby.nvim",
		config = function()
			require("tabby").setup()
		end,
	})

	use("nvim-lua/lsp-status.nvim") -- generate statusline components from the LSP client.

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
	use("nvim-treesitter/playground")
	use({ "RRethy/nvim-treesitter-textsubjects" })
	use({ "nvim-treesitter/nvim-treesitter-textobjects" })

	use({ "p00f/nvim-ts-rainbow" })

	use({ "weilbith/nvim-code-action-menu" })

	---- Completion and Snippets
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lsp-document-symbol",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"saadparwaiz1/cmp_luasnip",
			"David-Kunz/cmp-npm",
		},
		config = function()
			require("config.plugins.nvim-cmp")
		end,
	})
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
			require("nvim-autopairs").setup({
				fast_wrap = {},
			})
		end,
	})

	-- debug
	use("mfussenegger/nvim-dap")
	use("leoluz/nvim-dap-go")
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
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

	use({ "nanotee/sqls.nvim", ft = "sql" })

	use({
		"anuvyklack/pretty-fold.nvim",
		-- requires = "anuvyklack/nvim-keymap-amend", -- only for preview
		config = function()
			require("pretty-fold").setup()
			-- require("pretty-fold.preview").setup()
		end,
	})

	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup()
		end,
	})

	-- markdown
	use({
		"ekickx/clipboard-image.nvim",
		config = function()
			require("config.plugins.clipboard-image")
		end,
	})

	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && yarn install",
		config = function()
			require("config.plugins.markdown-preview")
		end,
	})

	use({
		"mickael-menu/zk-nvim",
		ft = "markdown",
		config = function()
			require("config.plugins.zk")
		end,
	})

	use({
		"goolord/alpha-nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
	})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
