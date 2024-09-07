--[[ Custom commands ]]
-------------------------------------------

-- Eslint
-- Add command `Lint directory` that sets eslint as a complier, launches it for js,ts files in the "directory"
-- and opens Trouble quickfix window with errors
local memoDir = "" -- save directory name
local function eslint(dir)
	vim.cmd([[compiler eslint]])

	if memoDir ~= "" then
		dir = memoDir
	end
	if dir ~= "" then
		memoDir = dir
	end
	-- local files = "*.{ts,js,jsx,tsx,svelte,vue}"
	-- vim.cmd("make " .. dir .. files)
	vim.cmd("make " .. dir)
	vim.cmd([[Trouble quickfix]])
end

vim.api.nvim_create_user_command("Lint", function(opts)
	eslint(opts.args)
end, { nargs = "?", desc = "Use Eslint in the given directory and launch quickfix in Trouble" })

-------------------------------------------
-- Toggle diagnostics
vim.api.nvim_create_user_command("DiagnosticToggle", function()
	vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = "Toggle diagnostics" })
