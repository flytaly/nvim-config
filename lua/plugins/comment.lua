return {
	"numToStr/Comment.nvim",
	dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
	config = function()
		-- Setup numToStr/Comment.nvim to work with treesitter and "nvim-ts-context-commentstring"
		-- to support svelte files that contain multiple languages.
		require("Comment").setup({
			pre_hook = function(ctx)
				local U = require("Comment.utils")

				local location = nil
				if ctx.ctype == U.ctype.block then
					location = require("ts_context_commentstring.utils").get_cursor_location()
				elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
					location = require("ts_context_commentstring.utils").get_visual_start_location()
				end

				return require("ts_context_commentstring.internal").calculate_commentstring({
					key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
					location = location,
				})
			end,
		})
	end,
}
