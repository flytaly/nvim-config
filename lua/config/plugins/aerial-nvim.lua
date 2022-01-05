local present, aerial = pcall(require, "aerial")

if not present then
	return
end

aerial.setup({

	-- Priority list of preferred backends for aerial
	backends = { "lsp", "treesitter", "markdown" },

	-- If close_on_select is true, aerial will automatically close after jumping to a symbol
	close_on_select = true,

	-- Enum: prefer_right, prefer_left, right, left, float
	-- Determines the default direction to open the aerial window. The 'prefer'
	-- options will open the window in the other direction *if* there is a
	-- different buffer in the way of the preferred direction
	default_direction = "prefer_left",

	on_attach = function(bufnr)
		-- Toggle the aerial window with <leader>a
		vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>xa", "<cmd>AerialToggle<CR>", {})
		-- Jump forwards/backwards
		vim.api.nvim_buf_set_keymap(bufnr, "n", "[a", "<cmd>AerialPrev<CR>", {})
		vim.api.nvim_buf_set_keymap(bufnr, "n", "]a", "<cmd>AerialNext<CR>", {})
		-- Jump up the tree
		vim.api.nvim_buf_set_keymap(bufnr, "n", "[[", "<cmd>AerialPrevUp<CR>", {})
		vim.api.nvim_buf_set_keymap(bufnr, "n", "]]", "<cmd>AerialNextUp<CR>", {})
	end,
})
