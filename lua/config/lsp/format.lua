local M = {}

vim.keymap.set("n", "<leader>gs", function()
	M.isEnabled = not M.isEnabled
end)

M.isEnabled = true

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

M.createAutocmd = function(client, bufnr)
	if not client.supports_method("textDocument/formatting") then
		return nil
	end

	vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
	vim.api.nvim_create_autocmd("BufWritePre", {
		group = augroup,
		buffer = bufnr,
		callback = function()
			if M.isEnabled then
				M.format(bufnr)
			end
		end,
	})
end

M.format = function(bufnr)
	vim.lsp.buf.format({
		bufnr = bufnr,
		filter = function(client)
			-- Never request following servers for formatting
			return client.name ~= "tsserver" and client.name ~= "sumneko_lua"
		end,
	})
end

return M
