local M = {}

vim.keymap.set("n", "yof", function()
	M.isEnabled = not M.isEnabled
	print("format on save", (M.isEnabled and "enabled" or "disabled"))
end, { desc = "Toggle format on save" })

M.isEnabled = true

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

M.createAutocmd = function(client, bufnr)
	if not client.supports_method("textDocument/formatting") then
		return nil
	end

	vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
	vim.api.nvim_create_autocmd("BufWritePost", {
		group = augroup,
		buffer = bufnr,
		callback = function()
			if M.isEnabled then
				vim.cmd([[ FormatWrite ]])
			end
		end,
	})
end

M.format = function(bufnr)
	vim.cmd([[ Format ]])
	--[[ local filetype = vim.bo.filetype

	--[[ vim.lsp.buf.format({
		bufnr = bufnr,
		filter = function(client)
			-- Never request following servers for formatting
			return client.name ~= "tsserver" and client.name ~= "lua_ls"
		end,
	}) ]]
end

return M
