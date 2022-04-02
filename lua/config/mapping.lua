--- MY REMAPING

-- Leader
vim.g.mapleader = " "

--- CLIPBOARD
-- copy to OS clipboard
map("n", "<leader>y", '"+y')
map("v", "<leader>y", '"+y')
map("n", "<leader>y", '"+yy')
-- paste from OS clipboard
map("n", "<leader>p", '"+p')
map("n", "<leader>P", '"+P')
map("v", "<leader>p", '"+p')
map("v", "<leader>P", '"+P"`"`"')
-- delete to OS clipboard
map("v", "<leader>d", '"+d')

map("n", "<C-e>", "<C-w>") -- remap <C-w> to split windows
map("n", "<C-w>", ":x<CR>") -- save and close
map("n", "<C-s>", ":w<CR>") -- save
map("i", "<C-s>", "<Esc>:w<CR>a") -- save
map("n", "<A-q>", ":q!<CR>") -- close w/o saving

map("n", "<C-t>n", ":tabnew<CR>")

-- Naviagate buffers
map("n", "<C-Right>", ":bnext<CR>")
map("n", "<C-Left>", ":bprevious<CR>")


map("n", "<S-l>", ":tabnext<CR>")
map("n", "<S-h>", ":tabprevious<CR>")

-- Move text up and down
map("v", "<A-j>", ":m '>+1<CR>gv=gv")
map("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- Stay in indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")

map("v", "p", '"_dP"') -- don't yank replaced text

map("n", "]<space>", ":call append(line('.'), '')<CR>")
map("n", "[<space>", ":call append(line('.')-1, '')<CR>")


map("n", "<leader>q", ":Bdelete<CR>")


map("n", "<F3>", ":set list!<CR>")
