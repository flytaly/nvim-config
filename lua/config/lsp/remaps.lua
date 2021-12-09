local function set_default_keymaps(_, bufnr)
	local function keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	-- Enable completion triggered by <c-x><c-o>
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	local opts = { noremap = true, silent = true }

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	keymap("n", "ga", "<cmd>CodeActionMenu<CR>", opts)
	keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	keymap("n", "gR", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	keymap("n", "g[", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
	keymap("n", "g]", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
	keymap("n", "gD", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
	keymap("n", "<leader>gd", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	keymap("n", "<leader>gf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

	keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)

	keymap("n", "<leader>fls", "<cmd>Telescope lsp_workspace_symbols<CR>", opts)
end

return {
	set_default_keymaps = set_default_keymaps,
}
