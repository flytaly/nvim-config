------------------------------------------------------
-- QuickScope
vim.cmd([[hi QuickScopePrimary guifg=#29CB2B gui=underline ctermfg=155 cterm=underline]])
vim.cmd([[hi QuickScopeSecondary guifg=#74CFD3 gui=underline ctermfg=81 cterm=underline]])

vim.cmd("colorscheme default")

local colorscheme = "tokyonight"

require("config.theme.theme").setup(colorscheme)
require("config.theme.cmp").setup()
