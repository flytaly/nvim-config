-- Add command `Lint directory` that sets eslint as a complier, launches it for js,ts files in the "directory"
-- and opens Trouble quickfix window with errors

local memoDir = "" -- save directory name

function eslint(dir)
	vim.cmd([[compiler eslint]])

	local files = "*.{ts,js,jsx,tsx,svelte}"
	if memoDir ~= "" then
		dir = memoDir
	end
	if dir ~= "" then
		memoDir = dir
		dir = dir .. "/**/"
	end
	vim.cmd("make " .. dir .. files)
	vim.cmd([[Trouble quickfix]])
end

vim.api.nvim_create_user_command("Lint", function(opts)
	eslint(opts.args)
end, { nargs = "?" })
