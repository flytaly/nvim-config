--- Colors
vim.g.tokyonight_colors = {
	comment = "#828ab0",
	gitSigns = { add = "#6f9b31", change = "#24a7db", delete = "#c82d35" },
}

vim.cmd([[colorscheme kanagawa]])

------------------------------------------------------
-- QuickScope
vim.cmd([[hi QuickScopePrimary guifg=#29CB2B gui=underline ctermfg=155 cterm=underline]])
vim.cmd([[hi QuickScopeSecondary guifg=#74CFD3 gui=underline ctermfg=81 cterm=underline]])
