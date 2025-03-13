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
					["dap-repl"] = false,
				},
			})

			vim.keymap.set("i", "<a-cr>", function()
				require("neocodeium").accept()
			end)
			vim.keymap.set("i", "<a-f>", function()
				require("neocodeium").accept()
			end)
			-- add tab
			vim.keymap.set("i", "<tab>", function()
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
	-- {
	-- 	"augmentcode/augment.vim",
	-- 	init = function()
	-- 		local ok, folders = pcall(require, "workspace-folders")
	-- 		vim.g.augment_workspace_folders = ok and folders or {}
	-- 	end,
	-- },
}
