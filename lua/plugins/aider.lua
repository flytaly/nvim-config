return {
	"joshuavial/aider.nvim",
	opts = {
		-- your configuration comes here
		-- if you don't want to use the default settings
		auto_manage_context = true, -- automatically manage buffer context
		default_bindings = false, -- use default <leader>A keybindings
		debug = false, -- enable debug logging
	},
	keys = {
		{ "<leader>ao", ":AiderOpen<CR>", mode = "n", desc = "Aider: Open" },
		{ "<leader>am", ":AiderAddModifiedFiles<CR>", mode = "n", desc = "Aider: Add Modified Files" },
	},
}
