--- David-Kunz/jester
vim.cmd([[
  nnoremap <leader>tt :lua require"jester".run()<cr>
  nnoremap <leader>t_ :lua require"jester".run_last()<cr>
  nnoremap <leader>tf :lua require"jester".run_file()<cr>
  nnoremap <leader>dd :lua require"jester".debug()<cr>
  nnoremap <leader>d_ :lua require"jester".debug_last()<cr>
  nnoremap <leader>dF :lua require"jester".debug_file()<cr>
]])
