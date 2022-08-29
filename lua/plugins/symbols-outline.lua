local ok, so = pcall(require, "symbols-outline")

if not ok then
	return
end

so.setup({
	highlight_hovered_item = true,
})
vim.keymap.set("n", "<leader>xo", "<cmd>SymbolsOutline<CR>")
