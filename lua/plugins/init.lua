require("config.packer-install")

local packer_present, packer = pcall(require, "packer")
if not packer_present then
	print("packer isn't installed")
	return
end

return packer.startup(function(use)
	use({ "wbthomason/packer.nvim" })
	use({ "kana/vim-textobj-entire", requires = { "kana/vim-textobj-user" } }) -- select entire buffer
	use({ "vim-scripts/restore_view.vim" })
	use({ "nvim-lua/plenary.nvim" }) -- useful lua functions
	use({ "unblevable/quick-scope" }) -- highlight unique chars
	use({ "nvim-lua/popup.nvim" })
	use({ "tpope/vim-fugitive" })
	use({ "tpope/vim-unimpaired" })
	use({ "machakann/vim-sandwich" }) -- vim surround alternative
	use({ "nathom/filetype.nvim" })
	use({ "mg979/vim-visual-multi" })
	use({ "lambdalisue/suda.vim" })
	use({ "folke/which-key.nvim", config = 'require("plugins.which-key")' })
	use({ "folke/trouble.nvim", config = 'require("plugins.trouble")' })
	use({ "vigoux/notifier.nvim", config = 'require("notifier").setup({})' })
	use({ "luukvbaal/stabilize.nvim", config = 'require("stabilize").setup()' })
	use({ "sidebar-nvim/sidebar.nvim", config = 'require("plugins.sidebar")' })
	use({ "nanozuki/tabby.nvim", config = 'require("tabby").setup()' })
	use({ "sindrets/diffview.nvim", config = 'require("plugins.diffview")' })
	use({ "szw/vim-maximizer", config = 'require("plugins.vim-maximizer")' }) -- maximize and restore windows
	use({ "lewis6991/gitsigns.nvim", config = 'require("plugins.gitsigns")' })
	use({ "feline-nvim/feline.nvim", config = 'require("plugins.statusline.feline")' })
	use({ "phaazon/hop.nvim", config = 'require("plugins.hop")' }) -- easy-motion alternative
	use({ "luukvbaal/nnn.nvim", config = 'require("plugins.nnn")' })
	use({ "kyazdani42/nvim-tree.lua", config = 'require("plugins.nvim-tree")' })
	use({ "akinsho/toggleterm.nvim", config = 'require("plugins.toggleterm")' })
	use({ "https://github.com/moll/vim-bbye" })
	use({ "knubie/vim-kitty-navigator", run = "cp ./*.py ~/.config/kitty/" }) -- consistent navigation between vim and terminal splits
	use({ "fladson/vim-kitty" }) -- syntax highlighting for Kitty config
	use({ "natecraddock/workspaces.nvim", config = 'require("plugins.workspaces")' })
	----- Folding
	use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async", config = 'require("plugins.nvim-ufo")' })

	----- Themes and styles
	use({ "stevearc/dressing.nvim", config = 'require("plugins.nvim-dressing")' })
	use({ "kyazdani42/nvim-web-devicons" })

	--[[ use({ "shaunsingh/nord.nvim" }) ]]
	--[[ use({ "folke/tokyonight.nvim" }) ]]
	--[[ use({ "rmehri01/onenord.nvim" }) ]]
	--[[ use({ "rebelot/kanagawa.nvim" }) ]]
	use({ "sainnhe/everforest" })
	use({ "catppuccin/nvim", as = "catppuccin", config = 'require("plugins.catppuccin")' })

	use({ "norcalli/nvim-colorizer.lua", config = 'require("plugins.nvim-colorizer")' })
	use({ "lukas-reineke/indent-blankline.nvim" }) -- indentation guides
	use({ "folke/zen-mode.nvim", config = 'require("plugins.zen-mode")' })

	----- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
			"nvim-telescope/telescope-dap.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
		},
		config = 'require("plugins.telescope")',
	})

	----- Use different layouts in normal and input modes
	----- Option 1: using xkbswitch
	-- use({ "lyokha/vim-xkbswitch", config = 'require("plugins.vim-xkbswitch")' })
	----- Option 2: using fcitx
	use({ "lilydjwg/fcitx.vim", config = 'require("plugins.fcitx")' })

	-------------------------
	----- Programming utils
	use({ "ray-x/go.nvim", requires = "ray-x/guihua.lua", config = 'require("plugins/go")', ft = "go" })
	use({ "nanotee/sqls.nvim", ft = "sql" })
	use({ "weilbith/nvim-code-action-menu" })
	use({ "mhartington/formatter.nvim" })
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	})
	use({ "nvim-lua/lsp-status.nvim" }) -- generate statusline components from the LSP client.
	use({ "jose-elias-alvarez/typescript.nvim" })
	use({ "jose-elias-alvarez/null-ls.nvim" })
	use({ "AndrewRadev/splitjoin.vim" })
	use({ "ThePrimeagen/refactoring.nvim", config = 'require("refactoring").setup({})' })
	use({ "windwp/nvim-autopairs", after = "nvim-cmp", config = 'require("plugins.nvim-autopairs")' })
	use({ "vuki656/package-info.nvim", requires = "MunifTanjim/nui.nvim", config = 'require("plugins.package-info")' })
	use({ "simrat39/symbols-outline.nvim", config = 'require("plugins.symbols-outline")' })

	----- Treesitter
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

	----- Comments
	use({
		"numToStr/Comment.nvim",
		requires = { "JoosepAlviste/nvim-ts-context-commentstring" },
		config = 'require("plugins.comment")',
	})
	use({ "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim", config = 'require("todo-comments").setup()' })

	----- Completion and Snippets
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
		config = 'require("plugins.nvim-cmp")',
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
		config = 'require("plugins.snippets")',
	})

	----- Debug
	use({ "mfussenegger/nvim-dap" })
	use({ "leoluz/nvim-dap-go" })
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
	use({
		"theHamsta/nvim-dap-virtual-text",
		config = 'require("nvim-dap-virtual-text").setup()',
	})

	----- Tests
	use({ "david-kunz/jester", config = 'require("plugins.jester")' })
	use({ "vim-test/vim-test", config = 'require("plugins.vim-test")' })

	----- Markdown and notes
	use({ "ekickx/clipboard-image.nvim", ft = "markdown", config = 'require("plugins.clipboard-image")' })
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && yarn install",
		config = 'require("plugins.markdown-preview")',
		ft = "markdown",
	})
	use({ "mickael-menu/zk-nvim", ft = "markdown", config = 'require("plugins.zk")' })
	use({ "preservim/vim-markdown" })

	use({
		"phaazon/mind.nvim",
		requires = "s1n7ax/nvim-window-picker",
		config = function()
			require("window-picker").setup()
			require("mind").setup()
		end,
	})
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
