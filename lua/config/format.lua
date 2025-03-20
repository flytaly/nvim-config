local saveData = require("config.save-data")

local M = {}

local default_vars = {
	format_on_save = true,
	formatter_js = "default",
	cwd = "",
}

local function updateVariables(update)
	if update == nil then
		return
	end

	if update["format_on_save"] ~= nil then
		vim.g.format_on_save = update["format_on_save"]
	end

	if update["formatter_js"] ~= nil then
		vim.g.formatter_js = update["formatter_js"]
	end
end

local function getVariables()
	return {
		format_on_save = vim.g.format_on_save,
		formatter_js = vim.g.formatter_js,
		cwd = vim.loop.cwd(),
	}
end

updateVariables(default_vars)

local load_variables_group = vim.api.nvim_create_augroup("load_variables", {})

local function load_and_update_variables()
	local restoredData = saveData.load()
	updateVariables(restoredData)
end

vim.api.nvim_create_autocmd("VimEnter", {
	group = load_variables_group,
	callback = load_and_update_variables,
})

vim.api.nvim_create_autocmd("DirChanged", {
	group = load_variables_group,
	callback = load_and_update_variables,
})

vim.keymap.set("n", "yof", function()
	updateVariables({ format_on_save = not vim.g.format_on_save })
	saveData.save(getVariables())
	print("format on save", (vim.g.format_on_save and "enabled" or "disabled"))
end, { desc = "Toggle format on save" })

local formattersJS = { "eslint", "default" }

vim.api.nvim_create_user_command("FormatterJSSet", function(opts)
	local formatter_js = opts.args or ""
	updateVariables({ formatter_js = formatter_js })
	saveData.save(getVariables())
end, {
	desc = "Set formatter for the project",
	nargs = "?",
	complete = function(arg_lead, cmd_line, cursor_pos)
		-- Filter formatters that match the current input
		local matches = {}
		for _, formatter in ipairs(formattersJS) do
			if formatter:find("^" .. arg_lead) then
				table.insert(matches, formatter)
			end
		end
		return matches
	end,
})

local function eslintfix(withMessage)
	if vim.fn.exists(":EslintFixAll") > 0 then
		vim.cmd([[EslintFixAll]])
		if withMessage then
			print("ESLint Fix")
		end
	else
		print("EslintFixAll command from Eslint LSP not found")
	end
end

M.format = function(params)
	params = params or { withMessage = true }

	local js_types = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte" }
	local filetype = vim.bo.filetype

	if vim.g.formatter_js == "eslint" and vim.tbl_contains(js_types, filetype) then
		eslintfix(params.withMessage)
		return
	end

	vim.cmd([[FormatWrite]])
	if params.withMessage then
		print("formatted")
	end
end

M.onSave = function(initial)
	vim.g.format_on_save = initial
	local groupId = vim.api.nvim_create_augroup("__formatter__", { clear = true })
	vim.api.nvim_create_autocmd("BufWritePost", {
		group = groupId,
		callback = function()
			if not vim.g.format_on_save or vim.bo.filetype == "go" then
				return
			end
			M.format({ withMessage = false })
		end,
	})
end

return M
