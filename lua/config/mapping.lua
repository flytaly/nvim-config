--- MY REMAPING

--- CLIPBOARD
-- copy to OS clipboard
map('n', '<leader>y', '"+y')
map('v', '<leader>y', '"+y')
map('n', '<leader>y', '"+yy')
-- paste from OS clipboard
map('n', '<leader>p', '"+p')
map('n', '<leader>P', '"+P')
map('v', '<leader>p', '"+p')
map('v', '<leader>P', '"+P"`"`"')
-- delete to OS clipboard
map('v', '<leader>d', '"+d')


map('n', '<leader>s', 'cl') -- default s is taken for hop motion
map('n', '<C-e>', '<C-w>') -- remap <C-w> to split windows
map('n', '<C-w>', ':x<CR>') -- save and close
map('n', '<A-q>', ':q!<CR>') -- close w/o saving

