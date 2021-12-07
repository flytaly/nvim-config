local ts_utils = require("nvim-lsp-ts-utils")

return function(on_attach)
	return {
		on_attach = function(client, bufnr)
			client.resolved_capabilities.document_formatting = false
			client.resolved_capabilities.document_range_formatting = false

			ts_utils.setup({
				eslint_bin = "eslint_d",
				eslint_enable_diagnostics = false,
				eslint_enable_code_actions = false,
				enable_formatting = true,
				formatter = "prettier",
			})
			ts_utils.setup_client(client)

			local opts = { silent = true }
			vim.api.nvim_buf_set_keymap(bufnr, "n", "gO", ":TSLspOrganize<CR>", opts)
			vim.api.nvim_buf_set_keymap(bufnr, "n", "gR", ":TSLspRenameFile<CR>", opts)
			vim.api.nvim_buf_set_keymap(bufnr, "n", "gI", ":TSLspImportAll<CR>", opts)

			on_attach(client, bufnr)
		end,
		flags = { debounce_text_changes = 200 },
	}
end
