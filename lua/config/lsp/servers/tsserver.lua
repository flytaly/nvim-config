local ts_utils = require("nvim-lsp-ts-utils")

local function filter(arr, fn)
	if type(arr) ~= "table" then
		return arr
	end

	local filtered = {}
	for k, v in pairs(arr) do
		if fn(v, k, arr) then
			table.insert(filtered, v)
		end
	end

	return filtered
end

local function filterReactDTS(value)
	return string.match(value.uri, "react/index.d.ts") == nil
end

-- Filter react definition files after using vim.lsp.buf.definition()
-- preventing opening quickfix window.
-- https://github.com/typescript-language-server/typescript-language-server/issues/216#issuecomment-1005272952
local handlers = {
	["textDocument/definition"] = function(err, result, method, ...)
		if vim.tbl_islist(result) and #result > 1 then
			local filtered_result = filter(result, filterReactDTS)
			return vim.lsp.handlers["textDocument/definition"](err, filtered_result, method, ...)
		end

		vim.lsp.handlers["textDocument/definition"](err, result, method, ...)
	end,
}

return function(on_attach)
	return {
		init_options = require("nvim-lsp-ts-utils").init_options,

		handlers = handlers,

		on_attach = function(client, bufnr)
			client.resolved_capabilities.document_formatting = false
			client.resolved_capabilities.document_range_formatting = false

			ts_utils.setup({
				eslint_bin = "eslint_d",
				eslint_enable_diagnostics = true,
				eslint_enable_code_actions = true,
				enable_formatting = true,
				formatter = "prettier",
			})
			ts_utils.setup_client(client)

			local opts = { silent = true }
			vim.api.nvim_buf_set_keymap(bufnr, "n", "gO", ":TSLspOrganize<CR>", opts)
			vim.api.nvim_buf_set_keymap(bufnr, "n", "gFR", ":TSLspRenameFile<CR>", opts)
			vim.api.nvim_buf_set_keymap(bufnr, "n", "gI", ":TSLspImportAll<CR>", opts)

			on_attach(client, bufnr)
		end,
		flags = { debounce_text_changes = 200 },
	}
end
