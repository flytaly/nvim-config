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

		wk.register({
			["<leader>"] = {
                ["`"] = {name = "Harpoon"},
				f = {
					name = "Telescope",
					n = { name = "npm" },
				},
				d = { name = "debug" },
				h = { name = "git" },
				x = { name = "Trouble" },
				t = { name = "Test" },
				n = { name = "File explorers" },
			},
		})

	end,
}
