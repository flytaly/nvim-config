local ok, nvim_tree = pcall(require, "nvim-tree")
if not ok then
	return
end

nvim_tree.setup({})

map("n", "<leader>no", ":NvimTreeToggle<CR>")
map("n", "<leader>nf", ":NvimTreeFindFile<CR>")
