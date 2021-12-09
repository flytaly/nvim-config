map("n", "t<C-n>", ":TestNearest<CR>", { silent = true })
map("n", "t<C-f>", ":TestFile<CR>", { silent = true })
map("n", "t<C-s>", ":TestSuite<CR>", { silent = true })
map("n", "t<C-l>", ":TestLast<CR>", { silent = true })
map("n", "t<C-g>", ":TestVisit<CR>", { silent = true })

vim.g["test#strategy"] = "neovim"
