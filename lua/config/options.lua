--- Default Neovim Options
local opt = vim.opt

opt.completeopt = { "menu", "menuone", "noselect" } -- better autocomplete options
opt.cmdheight = 1 -- only one line for commands
opt.encoding = "UTF-8"
opt.hidden = true -- allow hidden buffers
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
