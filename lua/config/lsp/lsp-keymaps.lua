local format = require("config.lsp.format")

local function set_default_keymaps(_, bufnr)
	-- Mappings.
	local opts = { noremap = true, silent = true, buffer = bufnr }

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	vim.keymap.set({ "n", "v" }, "ga", "<cmd>CodeActionMenu<CR>", opts)
	vim.keymap.set("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	vim.keymap.set("v", "<space>ca", ":'<,'>lua vim.lsp.buf.range_code_action()<CR>", opts)
	vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	vim.keymap.set("n", "<C-t>gd", ":tab split<CR>:lua vim.lsp.buf.definition()<CR>", opts)
	vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	-- use Trouble for references
	-- vim.keymap.set("n", "gR", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	vim.keymap.set("n", "g[", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
	vim.keymap.set("n", "g]", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
	vim.keymap.set("n", "gD", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	vim.keymap.set("n", "<leader>gd", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)

	vim.keymap.set("n", "<leader>gf", function()
		format.format()
	end)

	vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	vim.keymap.set({ "i", "n" }, "<C-'>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)

	vim.keymap.set("n", "<leader>fls", "<cmd>Telescope lsp_workspace_symbols<CR>", opts)
end

return {
	set_default_keymaps = set_default_keymaps,
}
