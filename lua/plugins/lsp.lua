return {
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	{
		-- defines some vtsls (TS LSP) commands
		"yioneko/nvim-vtsls",
		event = "VeryLazy",
		keys = {
			{ "gO", ":VtsExec organize_imports<CR>", desc = "TS: Organize Imports" },
			{ "gI", ":VtsExec add_missing_imports<CR>", desc = "TS: Add Missing Imports" },
		},
	},
}
