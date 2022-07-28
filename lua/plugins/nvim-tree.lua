local ok, nvim_tree = pcall(require, "nvim-tree")
if not ok then
	return
end

nvim_tree.setup({})

vim.keymap.set("n", "<leader>no", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>nf", ":NvimTreeFindFile<CR>")
