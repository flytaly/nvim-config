local saveData = require("config.save-data")

local M = {}

local default_vars = {
	format_on_save = true,
	formatter = "",
	cwd = "",
}

local function updateVariables(update)
	if update == nil then
		return
	end

	if update["format_on_save"] ~= nil then
		vim.g.format_on_save = update["format_on_save"]
	end

	if update["formatter"] ~= nil then
		vim.g.formatter = update["formatter"]
	end
end

local function getVariables()
	return {
		format_on_save = vim.g.format_on_save,
		formatter = vim.g.formatter,
		cwd = vim.loop.cwd(),
	}
end

updateVariables(default_vars)

vim.api.nvim_create_autocmd("VimEnter", {
	group = vim.api.nvim_create_augroup("load_variables", {}),
	callback = function()
		local restoredData = saveData.load()
		updateVariables(restoredData)
	end,
})

vim.keymap.set("n", "yof", function()
	updateVariables({ format_on_save = not vim.g.format_on_save })
	saveData.save(getVariables())
	print("format on save", (vim.g.format_on_save and "enabled" or "disabled"))
end, { desc = "Toggle format on save" })

vim.api.nvim_create_user_command("FormatterSet", function(opts)
	local formatter = opts.args or ""
	updateVariables({ formatter = formatter })
	saveData.save(getVariables())
end, { desc = "Set formatter for the project", nargs = "?" })

M.format = function(params)
	params = params or { withMessage = true }

	if vim.g.formatter == "eslint" and vim.fn.exists(":EslintFixAll") > 0 then
		vim.cmd([[EslintFixAll]])
		if params.withMessage then
			print("ESLint Fix")
		end
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
