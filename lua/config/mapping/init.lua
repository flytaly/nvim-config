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

vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- Navigate buffers
vim.keymap.set("n", "<C-Right>", ":bnext<CR>")
vim.keymap.set("n", "<C-Left>", ":bprevious<CR>")

-- Tabs
vim.keymap.set("n", "<S-l>", ":tabnext<CR>")
vim.keymap.set("n", "<S-h>", ":tabprevious<CR>")
vim.keymap.set("n", "<C-t>n", ":tabnew<CR>")

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Center screen after vertical movements
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- save and source
vim.keymap.set("n", "<leader>cx", function()
	vim.cmd("w")
	vim.cmd("so %")
end)

-- Close dap float windows and quickfix with q and Esc.
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "qf", "dap-float" },
	callback = function()
		vim.keymap.set("n", "q", "<cmd>close!<CR>", { silent = true, buffer = true })
		vim.keymap.set("n", "<Esc>", "<cmd>close!<CR>", { silent = true, buffer = true })
	end,
})
