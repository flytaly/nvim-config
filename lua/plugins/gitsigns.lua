return {
	"lewis6991/gitsigns.nvim",
	event = "VeryLazy",
	config = function()
		require("gitsigns").setup({
			on_attach = function(bufnr)
				local function map(mode, lhs, rhs, opts)
					opts = vim.tbl_extend("force", { noremap = true, silent = true, buffer = bufnr }, opts or {})
					vim.keymap.set(mode, lhs, rhs, opts)
				end

				-- Navigation
				map("n", "]c", ":Gitsigns next_hunk<CR>", { desc = "Gitsigns: Next hunk" })
				map("n", "[c", ":Gitsigns prev_hunk<CR>", { desc = "Gitsigns: Previous hunk" })

				-- Actions
				map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>", { desc = "Gitsigns: Stage hunk" })
				map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>", { desc = "Gitsigns: Reset hunk" })
				map("n", "<leader>hS", "<cmd>Gitsigns stage_buffer<CR>", { desc = "Gitsigns: Stage buffer" })
				map("n", "<leader>hu", "<cmd>Gitsigns undo_stage_hunk<CR>", { desc = "Gitsigns: Undo stage hunk" })
				map("n", "<leader>hR", "<cmd>Gitsigns reset_buffer<CR>", { desc = "Gitsigns: Reset buffer" })
				map("n", "<leader>hp", "<cmd>Gitsigns preview_hunk<CR>", { desc = "Gitsigns: Preview hunk" })
				map("n", "<leader>hd", "<cmd>Gitsigns diffthis<CR>", { desc = "Gitsigns: Diff this" })
				map(
					"n",
					"<leader>hD",
					'<cmd>lua require"gitsigns".diffthis("~")<CR>',
					{ desc = "Gitsigns: Diff this ~" }
				)
				map("n", "<leader>ht", "<cmd>Gitsigns toggle_deleted<CR>", { desc = "Gitsigns: Toggle deleted" })

				-- Text object
				map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Gitsigns: Select hunk" })
			end,
		})
	end,
}
