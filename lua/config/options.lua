--- Default Neovim Options
local opt = vim.opt

-- opt.completeopt = { "menu", "menuone", "noselect" } -- better autocomplete options
opt.cmdheight = 1 -- only one line for commands
opt.encoding = "UTF-8"
opt.ignorecase = true -- case insensitive search. Use \C to enable case sensitive.
opt.inccommand = "split"
opt.incsearch = true
opt.mouse = "a"
opt.backup = false -- don't create backup files
opt.writebackup = false -- don't create backup files
opt.showmode = false
opt.signcolumn = "yes"
opt.splitright = true -- splits to the right
opt.splitbelow = true -- splits below
opt.updatetime = 300
opt.undofile = true -- persists undo tree
opt.number = true
opt.relativenumber = true
opt.exrc = true

-- Folding
opt.foldcolumn = "1"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true
opt.foldmethod = "manual"
-- opt.foldtext = "foldtext()"
-- https://reddit.com/r/neovim/comments/16xz3q9/treesitter_highlighted_folds_are_now_in_neovim/
-- opt.foldexpr = "nvim_treesitter#foldexpr()"

if vim.loop.os_uname().sysname == "Linux" then
	opt.shell = "fish"
end

opt.termguicolors = true
opt.listchars = { eol = "↲", tab = "» ", trail = "~", extends = ">", precedes = "«", nbsp = "␣" }
opt.laststatus = 3

opt.wrap = false
opt.linebreak = true
opt.tabstop = 4
opt.shiftwidth = 2
opt.smartindent = true
opt.expandtab = true

opt.cursorline = true
opt.scrolloff = 8 -- Minimal number of screen lines to keep above and below the cursor.

opt.hlsearch = true -- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

opt.spelllang = "en_us,ru"
-- Enable spellcheck in some files
vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		local ft = vim.bo.filetype
		if ft ~= "markdown" and ft ~= "text" then
			return
		end
		vim.opt_local.spell = true
	end,
})

-- I don't know what the reason but in some files
-- folds don't work correctly, because some plugins can reset foldlevel.
-- So this is a temporary fix.
-- https://github.com/kevinhwang91/nvim-ufo/issues/57
-- vim.api.nvim_create_autocmd("BufEnter", {
-- 	group = vim.api.nvim_create_augroup("reset_folds", { clear = true }),
-- 	callback = function()
-- 		-- vim.cmd([[setlocal foldlevel=99]])
-- 		vim.cmd([[set foldlevelstart=99]])
-- 	end,
-- })
--
