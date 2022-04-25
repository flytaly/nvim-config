local M = {}

vim.keymap.set("n", "<leader>gs", function()
	M.isEnabled = not M.isEnabled
end)

M.isEnabled = true

M.createAutocmd = function(client)
	if client.resolved_capabilities.document_formatting then
		local lsp_format_augroup = "lsp_format_augroup"
		vim.api.nvim_create_augroup(lsp_format_augroup, { clear = true })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = lsp_format_augroup,
			callback = function()
				if M.isEnabled then
					vim.lsp.buf.formatting_sync(nil, 1000)
				end
			end,
		})
	end
end

return M
