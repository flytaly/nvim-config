function! Cond(Cond, ...)
  let opts = get(a:000, 0, {})
  return a:Cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

"""""""""" PLUGINS """""""""""
call plug#begin('~/local/share/nvim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-user'
Plug 'luukvbaal/nnn.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'szw/vim-maximizer', Cond(!exists('g:vscode'))
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'unblevable/quick-scope'

" themes and styles
Plug 'kyazdani42/nvim-web-devicons'
Plug 'shaunsingh/nord.nvim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

" switch from RU -> EN automatically
Plug 'lyokha/vim-xkbswitch'
Plug 'phaazon/hop.nvim'

""""" Programming """""
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'evanleck/vim-svelte', {'branch': 'main'}

" Coc - snippets and autocomplition 
Plug 'neoclide/coc.nvim', Cond(!exists('g:vscode'), {'branch': 'release'})

call plug#end()


let g:tokyonight_style = "storm"

""""""""""""""" automatic keyboard layout switch """"""""""""""" 
let g:XkbSwitchLib = '/usr/local/lib/libxkbswitch.so'
let g:XkbSwitchEnabled = 1
let g:XkbSwitchSkipGhKeys = ['gh', 'gH'] " restore gh to use in vscode


"""""""""" LEADER KEY """""""""""
let mapleader = " "
" map <Space> <Leader>


""""""""""" CLIPBOARD """"""""""" 

" use OS clipboard
" set clipboard+=unnamedplus

" copy to OS clipboard.
nmap <leader>y "+y
vmap <leader>y "+y
nmap <leader>yy "+yy

" paste from OS clipboard
nmap <leader>p "+p
nmap <leader>P "+P
vmap <leader>p "+p 
vmap <leader>P "+P"`"`"



"""""""""""""""""""" QuickScope """"""""""""""""""""
""" github.com/asvetliakov/vscode-neovim#quick-scope

highlight QuickScopePrimary guifg='#29CB2B' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#74CFD3' gui=underline ctermfg=81 cterm=underline



"""""""""""""""""""" COC """"""""""""""""""""
""" neoclide/coc.nvim

if !exists('g:vscode')
  """ Coc Plugin """
  source <sfile>:h/coc-init.vim

  " PMenu color
  hi Pmenu ctermfg=NONE ctermbg=61  cterm=NONE guifg=NONE guibg=#64666d gui=NONE
  hi PmenuSel ctermfg=NONE ctermbg=24 cterm=NONE guifg=NONE guibg=#204a87 gui=NONE

  " number column color
  highlight LineNr ctermfg=60


endif



"""""""""" MY REMAPING """""""""" 

""" default 's' is taken for easymotion
map <Leader>s cl

""" remap <C-w> to split windows
:nnoremap <C-e> <C-w>

""" allow quit via single keypress (Q)
map <C-w> :x<CR>

if exists('g:vscode')
  """ VSCODE commentary
  xmap gc  <Plug>VSCodeCommentary
  nmap gc  <Plug>VSCodeCommentary
  omap gc  <Plug>VSCodeCommentary
  nmap gcc <Plug>VSCodeCommentaryLine

  nnoremap <C-e>gd <Cmd>call VSCodeNotify('editor.action.revealDefinitionAside')<CR>
endif


" """""""""" Hop motion """""""""" 

lua require'hop'.setup { keys = 'etovxqpdygfblzhckisuran', jump_on_sole_occurrence = true }

map s <cmd>HopChar2<CR>

" JK: Line motions
map <Leader>j <cmd>HopLineStartAC<CR>
map <Leader>k <cmd>HopLineStartBC<CR>

"""""""""""""" nnn """"""""""""""
lua << EOF
  local builtin = require("nnn").builtin
  mappings = {
    { "<C-t>", builtin.open_in_tab },       -- open file(s) in tab
    { "<C-s>", builtin.open_in_split },     -- open file(s) in split
    { "<C-v>", builtin.open_in_vsplit },    -- open file(s) in vertical split
    { "<C-p>", builtin.open_in_preview },   -- open file in preview split keeping nnn focused
    { "<C-y>", builtin.copy_to_clipboard }, -- copy file(s) to clipboard
    { "<C-w>", builtin.cd_to_path },        -- cd to file directory
    { "<C-e>", builtin.populate_cmdline },  -- populate cmdline (:) with file(s)
    }
  require("nnn").setup({ 
  auto_open = { tabpage = "picker" },
    mappings = mappings
  })
EOF

" Set custom mappings
nnoremap <silent> <leader>nn :NnnPicker<CR>
nnoremap <silent> <leader>ne :NnnExplorer<CR>

" Start n³ in the current file's directory
nnoremap <leader>n :NnnPicker %:p:h<CR>



""""""""""""""""""" colors """""""""""""""""""
" SignColumn
hi SignColumn  ctermbg=None

" VIMDIFF 
hi DiffAdd      ctermfg=Green         ctermbg=None
hi DiffChange   ctermfg=NONE          ctermbg=None
hi DiffDelete   ctermfg=Red           ctermbg=None
hi DiffText     ctermfg=Black         ctermbg=Cyan

"""""" szw/vim-maximizer
nnoremap <leader>m :MaximizerToggle!<CR>

"""""" Telescope
nnoremap <leader><space> :Telescope git_files<CR>
nnoremap <leader>fo :Telescope file_browser<CR>
nnoremap <leader>fn :Telescope find_files<CR>
nnoremap <leader>fg :Telescope git_branches<CR>
nnoremap <leader>fb :Telescope buffers<CR>
nnoremap <leader>fr :Telescope registers<CR>
nnoremap <leader>ff :Telescope live_grep<CR>
nnoremap <leader>FF :Telescope grep_string<CR>


"""""" nvim-lualine/Lualine.nvim
lua << END
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
END



""""" setting optons
set relativenumber
set mouse=a
set ignorecase "case insensitive search. Use \C to enable case sensitive.
set encoding=UTF-8
set diffopt+=vertical
set incsearch
set nobackup
set nowritebackup
set cmdheight=1
set noshowmode


