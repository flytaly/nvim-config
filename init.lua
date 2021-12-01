require('plugins')

local cmd = vim.cmd
local g = vim.g
local opt = vim.opt

g.mapleader = " "

local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

------------------------------------------------------
-------------- MY REMAPING

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

map('n', '<leader>s', 'cl') -- default s is taken for hop motion
map('n', '<C-e>', '<C-w>') -- remap <C-w> to split windows
map('n', '<C-w>', ':x<CR>') -- save and close
map('n', '<A-q>', ':q!<CR>') -- close w/o saving

------------------------------------------------------
-- szw/vim-maximizer
map('n', '<leader>m', ':MaximizerToggle!<CR>')

------------------------------------------------------
-------------- Default Neovim Options
opt.completeopt = {'menu', 'menuone', 'noselect'} -- better autocomplete options
opt.cmdheight = 1 -- only one line for commands
opt.encoding = 'UTF-8'
opt.hidden = true -- allow hidden buffers
opt.ignorecase = true -- case insensitive search. Use \C to enable case sensitive.
opt.inccommand = 'nosplit'
opt.incsearch = true
opt.mouse = 'a'
opt.backup = false -- don't create backup files
opt.showmode = false
opt.writebackup = false -- don't create backup files
opt.signcolumn = 'yes'
opt.splitright = true -- splits to the right
opt.splitbelow = true -- splits below
opt.updatetime = 300
opt.undofile = true -- persists undo tree

------------------------------------------------------
----- Colors
g.tokyonight_colors = {
    comment = '#828ab0',
    gitSigns = {add = '#6f9b31', change = '#24a7db', delete = '#c82d35'}
}

cmd [[colorscheme tokyonight]]

------------------------------------------------------
-- QuickScope
cmd [[hi QuickScopePrimary guifg=#29CB2B gui=underline ctermfg=155 cterm=underline]]
cmd [[hi QuickScopeSecondary guifg=#74CFD3 gui=underline ctermfg=81 cterm=underline]]

------------------------------------------------------
----- automatic keyboard layout switch
-- lyokha/vim-xkbswitch
g.XkbSwitchLib = '/usr/local/lib/libxkbswitch.so'
g.XkbSwitchEnabled = 1

------------------------------------------------------
----- Hop Motion
require'hop'.setup { keys = 'etovxqpdygfblzhckisuran', jump_on_sole_occurrence = true }
map('n', 's','<cmd>HopChar2<CR>')
map('n', '<Leader>j', '<cmd>HopLineStartAC<CR>')
map('n', '<Leader>k', '<cmd>HopLineStartBC<CR>')

------------------------------------------------------
----- Telescope
map('n', '<leader><space>', ':Telescope git_files<CR>')
map('n', '<leader>fo', ':Telescope file_browser<CR>')
map('n', '<leader>fn', ':Telescope find_files<CR>')
map('n', '<leader>fg', ':Telescope git_branches<CR>')
map('n', '<leader>fb', ':Telescope buffers<CR>')
map('n', '<leader>fr', ':Telescope registers<CR>')
map('n', '<leader>ff', ':Telescope live_grep<CR>')
map('n', '<leader>FF', ':Telescope grep_string<CR>')


------------------------------------------------------
----- nvim-lualine/Lualine.nvim
require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'tokyonight',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff',
                  {'diagnostics', sources={'nvim_lsp', 'coc'}}},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}


------------------------------------------------------
----- sindrets/diffview.nvim
require('diffview').setup {
  file_panel = {
    position = "left",
  }
}


require('programming-config')


