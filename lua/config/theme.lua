------------------------------------------------------
-- QuickScope
vim.cmd([[hi QuickScopePrimary guifg=#29CB2B gui=underline ctermfg=155 cterm=underline]])
vim.cmd([[hi QuickScopeSecondary guifg=#74CFD3 gui=underline ctermfg=81 cterm=underline]])

-- colorscheme
vim.cmd("colorscheme default")

local colorscheme = "tokyonight"

local ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end

--- Colors
--
-- vim.g.tokyonight_colors = {
-- 	comment = "#828ab0",
-- 	gitSigns = { add = "#6f9b31", change = "#24a7db", delete = "#c82d35" },
-- }
