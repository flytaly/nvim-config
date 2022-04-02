-- Disable filetype plugin, use the new Lua version
vim.g.do_filetype_lua = 1
vim.g.did_load_filetypes = 0

vim.cmd([[au BufRead,BufNewFile *.pcss setfiletype css]])
vim.cmd([[au BufRead,BufNewFile *.prisma setfiletype prisma]])
vim.cmd([[au BufRead,BufNewFile *.txt setfiletype text]])
