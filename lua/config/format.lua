local save_data = require("config.save-data")

local M = {}

local default_vars = {
	format_on_save = true,
	formatters_override = {},
	cwd = "",
}

-- mhartington/formatter.nvim  formatters
local js = { "biome", "prettier", "eslint_d" }
M.formatter_list = {
	javascript = js,
	javascriptreact = js,
	typescript = js,
	typescriptreact = js,
	svelte = js,
	astro = js,
	vue = js,
	glsl = { "clangformat", "prettier" }, -- to work install prettier-plugin-glsl and add it to the prettier config: `plugins: ["prettier-plugin-glsl"]`
	css = { "biome", "prettier" },
	scss = { "biome", "prettier" },
	less = { "biome", "prettier" },
	html = { "prettier", "biome" },
	json = { "biome", "prettier" },
	jsonc = { "biome", "prettier" },
	yaml = { "prettier" },
	markdown = { "prettier" },
	graphql = { "biome", "prettier" },
	handlebars = { "prettier" },
	toml = { "prettier" },
	lua = { "stylua" },
	sql = { "pgformat" },
	sh = { "shfmt" },
	fish = { "fishindent" },
	python = { "black" },
}

local function update_variables(update)
	if update == nil then
		return
	end

	if update["format_on_save"] ~= nil then
		vim.g.format_on_save = update["format_on_save"]
	end

	if update["formatters_override"] ~= nil then
		vim.g.formatters_override =
			vim.tbl_extend("force", vim.g.formatters_override or {}, update["formatters_override"])
	end
end

local function get_variables()
	return {
		format_on_save = vim.g.format_on_save,
		formatters_override = vim.g.formatters_override,
		cwd = vim.loop.cwd(),
	}
end

M.get_overridden_formatter = function()
	return (get_variables().formatters_override or {})[vim.bo.filetype]
end

M.getVariables = get_variables

update_variables(default_vars)

local load_variables_group = vim.api.nvim_create_augroup("load_variables", {})

local function load_and_update_variables()
	local restoredData = save_data.load()
	update_variables(restoredData)
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
	update_variables({ format_on_save = not vim.g.format_on_save })
	save_data.save(get_variables())
	if vim.g.format_on_save then
		vim.notify("✅ format on save enabled")
	else
		vim.notify("❌ format on save disabled")
	end
end, { desc = "Toggle format on save" })

vim.api.nvim_create_user_command("FormatterSet", function(opts)
	local formatter = opts.args or ""
	local filetype = vim.bo.filetype
	update_variables({ formatters_override = { [filetype] = formatter } })
	save_data.save(get_variables())
	vim.notify("set formatter: [" .. filetype .. "] -> " .. formatter)
end, {
	desc = "Set filetype formatter for the working directory",
	nargs = "?",
	complete = function(arg_lead)
		local matches = {}
		if M.formatter_list[vim.bo.filetype] == nil then
			return
		end
		for _, formatter in ipairs(M.formatter_list[vim.bo.filetype]) do
			if formatter:find("^" .. arg_lead) then
				table.insert(matches, formatter)
			end
		end
		return matches
	end,
})

M.format = function(params)
	params = params or { withMessage = true }
	vim.cmd([[FormatWrite]])
	if params.withMessage then
		print("formatted", M.get_overridden_formatter())
	end
end

M.on_save = function(initial)
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
