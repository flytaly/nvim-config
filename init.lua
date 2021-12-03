vim.g.mapleader = " "

require('config.utils')
require('config.plugins')
require('config.options')
require('config.mapping')
require('config.theme')
require('config.lsp')
require('config.debug')

vim.cmd[[au BufRead,BufNewFile *.pcss setfiletype css]]

