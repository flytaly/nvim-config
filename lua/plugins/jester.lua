return {
	"david-kunz/jester",
	init = function()
		vim.keymap.set("n", "<leader>dd", function()
			require("jester").debug()
		end)
		vim.keymap.set("n", "<leader>d_", function()
			require("jester").debug_last()
		end)
		vim.keymap.set("n", "<leader>dF", function()
			require("jester").debug_file()
		end)
	end,
}
