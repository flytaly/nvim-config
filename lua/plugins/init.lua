require("config.packer-install")

local packer_present, packer = pcall(require, "packer")
if not packer_present then
	print("packer isn't installed")
	return
end

return packer.startup(function(use)
	use("wbthomason/packer.nvim")
	use({ -- select entire buffer
		"kana/vim-textobj-entire",
		requires = { "kana/vim-textobj-user" }, -- create your own text objects
	})
	-- use("vim-scripts/restore_view.vim")
	use("nvim-lua/plenary.nvim") -- useful lua functions
	use("unblevable/quick-scope") -- highlight unique chars
	use("nvim-lua/popup.nvim")
	use("tpope/vim-fugitive")
	use("machakann/vim-sandwich") -- vim surround alternative
	use("tpope/vim-unimpaired")
	use("nathom/filetype.nvim")
	use("mg979/vim-visual-multi")
	use("lambdalisue/suda.vim")
	use({
		"folke/which-key.nvim",
		config = function()
			require("plugins.which-key")
		end,
	})

	use({
		"folke/trouble.nvim",
		config = function()
			require("plugins.trouble")
		end,
	})

	use({
		"rcarriga/nvim-notify",
		config = function()
			vim.notify = require("notify")
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
			require("plugins.sidebar")
		end,
	})

	use({
		"nanozuki/tabby.nvim",
		config = function()
			require("tabby").setup()
		end,
	})

	use({
		"sindrets/diffview.nvim",
		config = function()
			require("plugins.diffview")
		end,
	})

	use({ -- maximize and restore windows
		"szw/vim-maximizer",
		config = function()
			require("plugins.vim-maximizer")
		end,
	})

	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("plugins.gitsigns")
		end,
	})

	use({
		"feline-nvim/feline.nvim",
		config = function()
			require("plugins.statusline.feline")
		end,
	})

	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
			"nvim-telescope/telescope-dap.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
		},
		config = function()
			require("plugins.telescope")
		end,
	})

	use({
		"phaazon/hop.nvim", -- easy-motion alternative
		config = function()
			require("plugins.hop")
		end,
	})

	use({
		"luukvbaal/nnn.nvim",
		config = function()
			require("plugins.nnn")
		end,
	})

	use({
		"kyazdani42/nvim-tree.lua",
		config = function()
			require("plugins.nvim-tree")
		end,
	})

	-- use different layouts in normal and input modes
	-- using xkbswitch
	-- use({
	-- 	"lyokha/vim-xkbswitch", --- switch from RU -> EN automatically
	-- 	config = function()
	-- 		require("plugins.vim-xkbswitch")
	-- 	end,
	-- })
	--
	-- using fcitx
	use({
		"lilydjwg/fcitx.vim",
		config = function()
			vim.g.fcitx5_remote = "/usr/bin/fcitx5-remote"
		end,
	})

	use({
		"akinsho/toggleterm.nvim",
		config = function()
			require("plugins.toggleterm")
		end,
	})

	use({ "https://github.com/moll/vim-bbye" })

	use({ "knubie/vim-kitty-navigator", run = "cp ./*.py ~/.config/kitty/" }) -- consistent navigation between vim and terminal splits

	use("fladson/vim-kitty")

	use({
		"kevinhwang91/nvim-ufo",
		requires = "kevinhwang91/promise-async",

		config = function()
			require("ufo").setup({
				provider_selector = function(bufnr, filetype, buftype)
					return { "treesitter", "indent" }
				end,
			})
			vim.keymap.set("n", "zR", require("ufo").openAllFolds)
			vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
		end,
	})

	------- Themes and styles
	use("kyazdani42/nvim-web-devicons")

	use("shaunsingh/nord.nvim")
	use("folke/tokyonight.nvim")
	use("rmehri01/onenord.nvim")
	use("rebelot/kanagawa.nvim")
	use("sainnhe/everforest")

	use({
		"catppuccin/nvim",
		as = "catppuccin",
		config = function()
			require("plugins.catppuccin")
		end,
	})

	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("plugins.nvim-colorizer")
		end,
	})

	use("lukas-reineke/indent-blankline.nvim") -- indentation guides

	use({
		"folke/zen-mode.nvim",
		config = function()
			require("plugins.zen-mode")
		end,
	})

	use({
		"stevearc/dressing.nvim",
		config = function()
			require("plugins.nvim-dressing")
		end,
	})

	use({
		"goolord/alpha-nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
	})

	-------------------------
	------- Programming utils
	use({ "fatih/vim-go" })
	use({ "nanotee/sqls.nvim", ft = "sql" })

	use("mhartington/formatter.nvim")

	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	})

	use("nvim-lua/lsp-status.nvim") -- generate statusline components from the LSP client.
	use("jose-elias-alvarez/typescript.nvim")
	use("jose-elias-alvarez/null-ls.nvim")
	use("AndrewRadev/splitjoin.vim")

	use({
		"ThePrimeagen/refactoring.nvim",
		config = function()
			require("refactoring").setup({})
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

	use({ -- a code outline window for skimming and quick navigation
		"stevearc/aerial.nvim",
		config = function()
			require("plugins.aerial-nvim")
		end,
	})

	use({
		"vuki656/package-info.nvim",
		requires = "MunifTanjim/nui.nvim",
		config = function()
			require("plugins.package-info")
		end,
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		requires = {
			"nvim-treesitter/playground",
			"nvim-treesitter/nvim-treesitter-textobjects",
			"RRethy/nvim-treesitter-textsubjects",
			"p00f/nvim-ts-rainbow",
		},
		run = function()
			vim.cmd([[TSUpdate]])
		end,
		config = function()
			require("plugins.treesitter")
		end,
	})

	use("weilbith/nvim-code-action-menu")

	-------------------------
	------- Comments
	use({
		"numToStr/Comment.nvim",
		requires = { "JoosepAlviste/nvim-ts-context-commentstring" },
		config = function()
			require("plugins.comment")
		end,
	})
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup()
		end,
	})

	-------------------------------
	------- Completion and Snippets
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
			require("plugins.nvim-cmp")
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
			require("plugins.snippets")
		end,
	})

	-------------------------------
	------- Debug
	use("mfussenegger/nvim-dap")
	use("leoluz/nvim-dap-go")
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
	use({
		"theHamsta/nvim-dap-virtual-text",
		config = function()
			require("nvim-dap-virtual-text").setup()
		end,
	})

	-------------------------------
	------- Tests
	use({
		"david-kunz/jester",
		config = function()
			require("plugins.jester")
		end,
	})
	use({
		"vim-test/vim-test",
		config = function()
			require("plugins.vim-test")
		end,
	})

	---------------------------
	------- Markdown and notes
	use({
		"ekickx/clipboard-image.nvim",
		config = function()
			require("plugins.clipboard-image")
		end,
	})
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && yarn install",
		config = function()
			require("plugins.markdown-preview")
		end,
	})
	use({
		"mickael-menu/zk-nvim",
		ft = "markdown",
		config = function()
			require("plugins.zk")
		end,
	})
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
