-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function() vim.highlight.on_yank({ timeout = 200 }) end,
})

vim.api.nvim_create_autocmd("BufEnter", {
	group = vim.api.nvim_create_augroup("restore_folds", { clear = true }),
	callback = function()
		if vim.b.was_loaded then
			return
		end
		vim.b.was_loaded = true
		vim.cmd([[silent! loadview]])
	end,
})

vim.api.nvim_create_autocmd("BufWinLeave", {
	group = vim.api.nvim_create_augroup("save_folds", { clear = true }),
	callback = function() vim.cmd([[silent! mkview]]) end,
})
