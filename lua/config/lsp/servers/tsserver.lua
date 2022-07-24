local M = {}

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

M.setup = function()
	--jose-elias-alvarez/typescript.nvim
	local presentTS, TS = pcall(require, "typescript")
	if presentTS then
		TS.setup({
			server = {
				handlers = handlers,
				flags = { debounce_text_changes = 200 },
			},
		})

		vim.keymap.set("n", "gO", ":TypescriptOrganizeImports<CR>")
		vim.keymap.set("n", "gFR", ":TypescriptRenameFile<CR>")
		vim.keymap.set("n", "gI", ":TypescriptAddMissingImport<CR>")
	end
end

return M
