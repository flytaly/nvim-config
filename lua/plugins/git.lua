return {
	-- { "tpope/vim-fugitive", event = "VeryLazy", keys = { { "<leader>gg", "<cmd>Git<cr>", desc = "Open Git" } } },
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration
			"nvim-telescope/telescope.nvim", -- optional
		},
		config = true,
		keys = { { "<leader>gg", "<cmd>Neogit<cr>", desc = "Open Git" } },
	},
	{
		"sindrets/diffview.nvim",
		event = "VeryLazy",
		opts = { file_panel = { win_config = { position = "left" } } },
		keys = { { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diffview: Open" } },
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				attach_to_untracked = true,
				on_attach = function(bufnr)
					local function map(mode, lhs, rhs, opts)
						opts = vim.tbl_extend("force", { noremap = true, silent = true, buffer = bufnr }, opts or {})
						vim.keymap.set(mode, lhs, rhs, opts)
					end

					-- Navigation
					map("n", "]c", ":Gitsigns next_hunk<CR>", { desc = "Gitsigns: Next hunk" })
					map("n", "[c", ":Gitsigns prev_hunk<CR>", { desc = "Gitsigns: Previous hunk" })

					-- Actions
					map({ "n", "v" }, "<leader>gs", ":Gitsigns stage_hunk<CR>", { desc = "Gitsigns: Stage hunk" })
					map({ "n", "v" }, "<leader>gr", ":Gitsigns reset_hunk<CR>", { desc = "Gitsigns: Reset hunk" })
					map("n", "<leader>gS", "<cmd>Gitsigns stage_buffer<CR>", { desc = "Gitsigns: Stage buffer" })
					map("n", "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<CR>", { desc = "Gitsigns: Undo stage hunk" })
					map("n", "<leader>gR", "<cmd>Gitsigns reset_buffer<CR>", { desc = "Gitsigns: Reset buffer" })
					map("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>", { desc = "Gitsigns: Preview hunk" })
					-- map("n", "<leader>gd", "<cmd>Gitsigns diffthis<CR>", { desc = "Gitsigns: Diff this" })
					map("n", "<leader>gb", "<cmd>Gitsigns blame<CR>", { desc = "Gitsigns: Blame" })
					map("n", "<leader>gB", "<cmd>Gitsigns blame_line<CR>", { desc = "Gitsigns: Blame line" })
					map(
						"n",
						"<leader>gD",
						'<cmd>lua require"gitsigns".diffthis("~")<CR>',
						{ desc = "Gitsigns: Diff this ~" }
					)
					map("n", "<leader>gt", "<cmd>Gitsigns toggle_deleted<CR>", { desc = "Gitsigns: Toggle deleted" })

					-- Text object
					map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Gitsigns: Select hunk" })
				end,
			})
		end,
	},
}
