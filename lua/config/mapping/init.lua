vim.g.mapleader = " "

--- CLIPBOARD
-- copy to OS clipboard
vim.keymap.set("n", "<leader>y", '"+y', { desc = "Copy selected to OS clipboard" })
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Copy selected to OS clipboard" })
vim.keymap.set("n", "<leader>y", '"+yy', { desc = "Copy selected to OS clipboard" })
-- paste from OS clipboard
vim.keymap.set("n", "<leader>p", '"+p', { desc = "Paste from OS clipboard" })
vim.keymap.set("n", "<leader>P", '"+P', { desc = "Paste from OS clipboard" })
vim.keymap.set("v", "<leader>p", '"+p')
vim.keymap.set("v", "<leader>P", '"+P"`"`"')
-- delete to OS clipboard
vim.keymap.set("v", "<leader>d", '"+d', { desc = "Delete to OS clipboard" })

-- https://strdr4605.com/clean-paste-in-neovim-paste-text-without-newlines-and-leading-whitespace
vim.keymap.set("n", "yp", function()
	-- Get content from register 0 (most recent yank)
	local yanked_text = vim.fn.getreg("0")
	-- Remove trailing newline if present
	yanked_text = yanked_text:gsub("\n$", "")
	-- Remove leading whitespace
	yanked_text = yanked_text:gsub("^%s+", "")
	-- Store in register p
	vim.fn.setreg("p", yanked_text)
	-- Paste from register p
	return '"pp'
end, { expr = true, desc = "Paste without trailing newline and leading whitespace" })

vim.keymap.set("v", "p", '"_dP"') -- don't yank replaced text

vim.keymap.set("n", "<C-e>", ":x<CR>", { desc = "Save and close" })
vim.keymap.set("n", "<C-s>", ":w<CR>", { desc = "Save" })
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>a", { desc = "Save" })
vim.keymap.set("n", "<A-q>", ":q!<CR>", { desc = "Close without saving" })

vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- Navigate buffers
vim.keymap.set("n", "<C-Right>", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<C-Left>", ":bprevious<CR>", { desc = "Previous buffer" })

-- Tabs
vim.keymap.set("n", "<S-l>", ":tabnext<CR>", { desc = "Next tab" })
vim.keymap.set("n", "<S-h>", ":tabprevious<CR>", { desc = "Previous tab" })
vim.keymap.set("n", "<C-t>n", ":tabnew<CR>", { desc = "New tab" })
vim.keymap.set("n", "<C-t>q", ":tabclose<CR>", { desc = "Close tab" })

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Center screen after vertical movements
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>np", ":echo expand('%:p')<CR>", { desc = "Print full path" })

-- save and source
vim.keymap.set("n", "<leader>cx", function()
	vim.cmd("w")
	vim.cmd("so %")
end, { desc = "Save and source" })

-- Close dap float windows and quickfix with q and Esc.
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "qf", "dap-float" },
	callback = function()
		vim.keymap.set("n", "q", "<cmd>close!<CR>", { silent = true, buffer = true, desc = "Close" })
		vim.keymap.set("n", "<Esc>", "<cmd>close!<CR>", { silent = true, buffer = true, desc = "Close" })
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "fugitive" },
	callback = function() vim.keymap.set("n", "q", "<cmd>close!<CR>", { silent = true, buffer = true, desc = "Close" }) end,
})
