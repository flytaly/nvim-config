require("nvim-treesitter.configs").setup({
	ensure_installed = { "typescript", "javascript", "svelte", "css", "cpp", "lua", "vim" },
	-- JoosepAlviste/nvim-ts-context-commentstring
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
})
