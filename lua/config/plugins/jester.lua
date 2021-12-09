--- David-Kunz/jester
vim.cmd([[
  nnoremap <leader>dd :lua require"jester".debug()<cr>
  nnoremap <leader>d_ :lua require"jester".debug_last()<cr>
  nnoremap <leader>dF :lua require"jester".debug_file()<cr>
]])
