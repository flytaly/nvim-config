return {
	"Exafunction/codeium.vim",
	init = function()
		vim.g.codeium_log_file = "~/.codeium/codeium.log"
		vim.g.codeium_disable_bindings = 1
		vim.keymap.set("i", "<c-.>", function()
			return vim.fn["codeium#CycleCompletions"](1)
		end, { expr = true, desc = "Codeium: Go to next completion" })
		vim.keymap.set("i", "<c-,>", function()
			return vim.fn["codeium#CycleCompletions"](-1)
		end, { expr = true, desc = "Codeium: Go to previous completion" })
		vim.keymap.set("i", "<c-x>", function()
			return vim.fn["codeium#Clear"]()
		end, { expr = true, desc = "Codeium: Clear current completion" })
		vim.keymap.set("i", "<c-cr>", function()
			return vim.fn["codeium#Accept"]()
		end, { expr = true, desc = "Codeium: Accept current completion" })
	end,
}
