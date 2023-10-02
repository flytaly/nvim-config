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
opt.relativenumber = true
opt.exrc = true

-- Folding
opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
opt.foldcolumn = "1"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true
-- opt.foldmethod = "expr"
-- https://reddit.com/r/neovim/comments/16xz3q9/treesitter_highlighted_folds_are_now_in_neovim/
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldtext = "v:lua.vim.treesitter.foldtext()"

opt.shell = "fish"
opt.termguicolors = true
opt.listchars = "eol:$,tab:>-,trail:~,extends:>,precedes:<,space:␣"
opt.laststatus = 3

opt.wrap = false
opt.tabstop = 4
opt.shiftwidth = 4
opt.smartindent = true
opt.expandtab = true

opt.scrolloff = 4
