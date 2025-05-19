return {
	{
		"monkoose/neocodeium",
		event = "VeryLazy",
		-- enabled = false,
		config = function()
			local neocodeium = require("neocodeium")
			neocodeium.setup({
				-- manual = true,
				filetypes = {
					DressingInput = false,
					TelescopePrompt = false,
					["snacks_picker_input"] = false,
					["dap-repl"] = false,
					["markdown"] = false,
					["text"] = false,
					["copilot-chat"] = false,
				},
			})

			vim.keymap.set("i", "<a-cr>", function() require("neocodeium").accept() end)
			vim.keymap.set("i", "<a-f>", function() require("neocodeium").accept() end)
			-- add tab
			vim.keymap.set("i", "<tab>", function() require("neocodeium").accept() end)

			vim.keymap.set("i", "<A-w>", function() require("neocodeium").accept_word() end)
			vim.keymap.set("i", "<a-a>", function() require("neocodeium").accept_line() end)
			vim.keymap.set("i", "<a-,>", function() require("neocodeium").cycle_or_complete() end)
			vim.keymap.set("i", "<a-.>", function() require("neocodeium").cycle_or_complete(-1) end)
			vim.keymap.set("i", "<a-C>", function() require("neocodeium").clear() end)

			vim.api.nvim_create_user_command("NeoCodeiumEnableBuffer", function()
				vim.cmd("NeoCodeium enable")
				vim.cmd("NeoCodeium enable_buffer")
			end, { desc = "Start neocodeium and enable for current buffer" })
		end,
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			-- { "zbirenbaum/copilot.lua" },
			{ "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
		},
		build = "make tiktoken", -- Only on MacOS or Linux
		opts = {},
	},
}
