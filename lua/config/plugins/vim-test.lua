vim.keymap.set("n", "t<C-n>", ":TestNearest<CR>", { silent = true })
vim.keymap.set("n", "t<C-f>", ":TestFile<CR>", { silent = true })
vim.keymap.set("n", "t<C-s>", ":TestSuite<CR>", { silent = true })
vim.keymap.set("n", "t<C-l>", ":TestLast<CR>", { silent = true })
vim.keymap.set("n", "t<C-g>", ":TestVisit<CR>", { silent = true })

vim.g["test#strategy"] = "neovim"
