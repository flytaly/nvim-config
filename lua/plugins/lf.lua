return {
	"lmburns/lf.nvim",
	config = function()
		require("lf").setup({
			escape_quit = true,
			border = "rounded",
		})

		vim.keymap.set("n", "<Leader>nl", "<Cmd>Lf<CR>", { desc = "LF: Open" })

		vim.api.nvim_create_autocmd("User", {
			pattern = "LfTermEnter",
			callback = function(a)
				vim.api.nvim_buf_set_keymap(a.buf, "t", "q", "q", { nowait = true })
			end,
		})
	end,
	dependencies = { "toggleterm.nvim" },
}
