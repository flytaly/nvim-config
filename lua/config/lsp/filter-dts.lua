local M = {}

-- https://github.com/typescript-language-server/typescript-language-server/issues/216#issuecomment-1195404067

M.filter = function(arr, fn)
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
	return string.match(value.filename, "%.d.ts") == nil
end

M.on_list = function(options)
	local items = options.items
	if #items > 1 then
		local filtered = M.filter(items, filterReactDTS)
		if #filtered == 1 then
			items = filtered
		end
	end
	vim.fn.setqflist({}, " ", { title = options.title, items = items, context = options.context })
	if #items == 1 then
		vim.api.nvim_command("cfirst") -- or maybe you want 'copen' instead of 'cfirst'
	else
		-- vim.api.nvim_command("copen")
		vim.cmd([[Trouble quickfix]])
	end
end

return M
