local M = {}

vim.keymap.set("n", "<leader>gs", function()
	M.isEnabled = not M.isEnabled
end)

M.isEnabled = true

local is08Version = vim.fn.has("nvim-0.8") == 1

M.createAutocmd = function(client, bufnr)
	if not client.supports_method("textDocument/formatting") then
		return nil
	end

	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
	vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
	vim.api.nvim_create_autocmd("BufWritePre", {
		group = augroup,
		buffer = bufnr,
		callback = function()
			if not M.isEnabled then
				return nil
			end
		end,
	})

	M.format(bufnr)
end

M.format = function(bufnr)
	if is08Version then
		vim.lsp.buf.format({
			bufnr = bufnr,
			filter = function(client)
				-- Never request following servers for formatting
				return client.name ~= "tsserver" and client.name ~= "sumneko_lua"
			end,
		})
	else
		vim.lsp.buf.formatting_sync()
	end
end

return M
