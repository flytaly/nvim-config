vim.g.mapleader = " "

--- CLIPBOARD
-- copy to OS clipboard
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>y", '"+yy')
-- paste from OS clipboard
vim.keymap.set("n", "<leader>p", '"+p')
vim.keymap.set("n", "<leader>P", '"+P')
vim.keymap.set("v", "<leader>p", '"+p')
vim.keymap.set("v", "<leader>P", '"+P"`"`"')
-- delete to OS clipboard
vim.keymap.set("v", "<leader>d", '"+d')

vim.keymap.set("v", "p", '"_dP"') -- don't yank replaced text

vim.keymap.set("n", "<C-e>", ":x<CR>") -- save and close
vim.keymap.set("n", "<C-s>", ":w<CR>") -- save
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>a") -- save
vim.keymap.set("n", "<A-q>", ":q!<CR>") -- close w/o saving

-- Navigate buffers
vim.keymap.set("n", "<C-Right>", ":bnext<CR>")
vim.keymap.set("n", "<C-Left>", ":bprevious<CR>")

-- Tabs
vim.keymap.set("n", "<S-l>", ":tabnext<CR>")
vim.keymap.set("n", "<S-h>", ":tabprevious<CR>")
vim.keymap.set("n", "<C-t>n", ":tabnew<CR>")

-- Move text up and down
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("n", "]<space>", ":call append(line('.'), '')<CR>")
vim.keymap.set("n", "[<space>", ":call append(line('.')-1, '')<CR>")

vim.keymap.set("n", "<leader>q", ":Bdelete<CR>")

vim.keymap.set("n", "<F7>", ":set list!<CR>")

vim.keymap.set("n", "<F8>", function()
	require("null-ls").toggle("cspell")
end)
