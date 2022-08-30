--- Default Neovim Options
local opt = vim.opt

opt.completeopt = { "menu", "menuone", "noselect" } -- better autocomplete options
opt.cmdheight = 1 -- only one line for commands
opt.encoding = "UTF-8"
opt.ignorecase = true -- case insensitive search. Use \C to enable case sensitive.
opt.inccommand = "nosplit"
opt.incsearch = true
opt.mouse = "a"
opt.backup = false -- don't create backup files
opt.showmode = false
opt.writebackup = false -- don't create backup files
opt.signcolumn = "yes"
opt.splitright = true -- splits to the right
opt.splitbelow = true -- splits below
opt.updatetime = 300
opt.undofile = true -- persists undo tree

opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
opt.foldcolumn = "1"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true
-- opt.foldmethod = "expr"
-- opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.shell = "fish"
opt.termguicolors = true
opt.listchars = "eol:$,tab:>-,trail:~,extends:>,precedes:<,space:␣"
opt.laststatus = 3

opt.wrap = false
opt.tabstop = 4
opt.shiftwidth = 4
opt.smartindent = true
opt.expandtab = true

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ timeout = 200 })
	end,
})
