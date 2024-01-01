local M = {}

M.isEnabled = false

vim.keymap.set("n", "yof", function()
	M.isEnabled = not M.isEnabled
	print("format on save", (M.isEnabled and "enabled" or "disabled"))
end, { desc = "Toggle format on save" })

M.format = function()
	vim.cmd([[FormatWrite]])
	print("format")
end

M.onSave = function(initial)
	M.isEnabled = initial
	local groupId = vim.api.nvim_create_augroup("__formatter__", { clear = true })
	vim.api.nvim_create_autocmd("BufWritePost", {
		group = groupId,
		callback = function()
			if not M.isEnabled or vim.bo.filetype == "go" then
				return
			end
			vim.cmd([[FormatWriteLock]])
		end,
	})
end

return M
