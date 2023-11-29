return {
	"numToStr/Comment.nvim",
	dependencies = { "JoosepAlviste/nvim-ts-context-commentstring", "nvim-treesitter/nvim-treesitter" },
	config = function()
		vim.g.skip_ts_context_commentstring_module = true
		-- Setup numToStr/Comment.nvim to work with treesitter and "nvim-ts-context-commentstring"
		-- to support files that contain multiple languages (svelte, vue...).
		require("Comment").setup({
			pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
		})
	end,
}
