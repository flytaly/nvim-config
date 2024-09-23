return {
	-- {
	-- 	"Exafunction/codeium.vim",
	--
	-- 	init = function()
	-- 		vim.g.codeium_log_file = "~/.codeium/codeium.log"
	-- 		vim.g.codeium_disable_bindings = 1
	-- 		vim.keymap.set("i", "<a-.>", function()
	-- 			return vim.fn["codeium#CycleCompletions"](1)
	-- 		end, { expr = true, desc = "Codeium: Go to next completion" })
	-- 		vim.keymap.set("i", "<a-,>", function()
	-- 			return vim.fn["codeium#CycleCompletions"](-1)
	-- 		end, { expr = true, desc = "Codeium: Go to previous completion" })
	-- 		vim.keymap.set("i", "<a-c>", function()
	-- 			return vim.fn["codeium#Clear"]()
	-- 		end, { expr = true, desc = "Codeium: Clear current completion" })
	-- 		vim.keymap.set("i", "<a-cr>", function()
	-- 			return vim.fn["codeium#Accept"]()
	-- 		end, { expr = true, desc = "Codeium: Accept current completion" })
	-- 	end,
	-- },
	{
		"monkoose/neocodeium",
		event = "VeryLazy",
		config = function()
			local neocodeium = require("neocodeium")
			neocodeium.setup({
				filetypes = {
					TelescopePrompt = false,
					["dap-repl"] = false,
				},
			})

			vim.keymap.set("i", "<a-cr>", function()
				require("neocodeium").accept()
			end)
			vim.keymap.set("i", "<A-w>", function()
				require("neocodeium").accept_word()
			end)
			vim.keymap.set("i", "<a-a>", function()
				require("neocodeium").accept_line()
			end)
			vim.keymap.set("i", "<a-,>", function()
				require("neocodeium").cycle_or_complete()
			end)
			vim.keymap.set("i", "<a-.>", function()
				require("neocodeium").cycle_or_complete(-1)
			end)
			vim.keymap.set("i", "<a-C>", function()
				require("neocodeium").clear()
			end)
		end,
	},
}
