function! Cond(Cond, ...)
  let opts = get(a:000, 0, {})
  return a:Cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

"""""""""" PLUGINS """"""""""" 
call plug#begin('~/local/share/nvim/plugged')

Plug 'tpope/vim-surround'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'luukvbaal/nnn.nvim'
Plug 'junegunn/fzf'
Plug 'unblevable/quick-scope'

" switch from RU -> EN automatically
Plug 'lyokha/vim-xkbswitch'

" use normal easymotion when in vim mode
Plug 'easymotion/vim-easymotion', Cond(!exists('g:vscode'))
" use vscode easymotion when in vscode mode
Plug 'asvetliakov/vim-easymotion', Cond(exists('g:vscode'), { 'as': 'vsc-easymotion' })

""""" Programming """""
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'evanleck/vim-svelte', {'branch': 'main'}

" Coc - snippets and autocomplition 
Plug 'neoclide/coc.nvim', Cond(!exists('g:vscode'), {'branch': 'release'})

call plug#end()



set relativenumber
set ignorecase "case insensitive search. Use \C to enable case sensitive.



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


"""""""""" Easy motion """""""""" 

let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" map <Bslash> <Plug>(easymotion-prefix)
nmap s <Plug>(easymotion-bd-f2)

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)




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

