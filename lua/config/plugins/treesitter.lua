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
})
