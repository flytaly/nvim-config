return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	config = function()
		local wk = require("which-key")
		wk.setup({})

		wk.add({
			{ "<leader>`", group = "Harpoon" },
			{ "<leader>d", group = "debug" },
			{ "<leader>f", group = "Telescope" },
			{ "<leader>fn", group = "npm" },
			{ "<leader>h", group = "git" },
			{ "<leader>n", group = "File explorers" },
			{ "<leader>t", group = "Test" },
			{ "<leader>x", group = "Trouble" },
		})
	end,
}
