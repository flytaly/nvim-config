require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"c",
		"comment",
		"cpp",
		"css",
		"fish",
		"glsl",
		"go",
		"html",
		"java",
		"javascript",
		"jsdoc",
		"json",
		"jsonc",
		"lua",
		"markdown",
		"prisma",
		"python",
		"query",
		"rst",
		"rust",
		"svelte",
		"tsx",
		"typescript",
		"vim",
	},

	-- JoosepAlviste/nvim-ts-context-commentstring
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	highlight = {
		enable = true,
	},
	matchup = {
		enable = true,
	},

	-- RRethy/nvim-treesitter-textsubjects
	textsubjects = {
		enable = true,
		prev_selection = ",", -- (Optional) keymap to select the previous selection
		keymaps = {
			["."] = "textsubjects-smart",
			[";"] = "textsubjects-container-outer",
		},
	},

	-- nvim-treesitter/nvim-treesitter-textobjects
	textobjects = {
		select = {
			enable = true,

			-- Automatically jump forward to textobj, similar to targets.vim
			lookahead = true,

			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
		},
	},
})
