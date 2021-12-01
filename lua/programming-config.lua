local cmd = vim.cmd

------------------------------------------------------
----- nvim-cmp
local cmp = require 'cmp'

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        end
    },
    mapping = {
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'}),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
        ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close()
        }),
        ['<CR>'] = cmp.mapping.confirm({select = true})
    },
    sources = cmp.config.sources({
        {name = 'nvim_lsp'}, {name = 'vsnip'} -- For vsnip users.
    }, {{name = 'buffer'}})
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {sources = {{name = 'buffer'}}})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    sources = cmp.config.sources({{name = 'path'}}, {{name = 'cmdline'}})
})

------------------------------------------------------
----- vsnip
cmd([[
  " Expand
  imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
  smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

  " Expand or jump
  imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
  smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

  " Jump forward or backward
  imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
  smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
  imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
  smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

  " Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
  " See https://github.com/hrsh7th/vim-vsnip/pull/50
  nmap       <leader>c   <Plug>(vsnip-select-text)
  xmap       <leader>c   <Plug>(vsnip-select-text)

  " If you want to use snippet for multiple filetypes, you can `g:vsnip_filetypes` for it.
  let g:vsnip_filetypes = {}
  let g:vsnip_filetypes.javascriptreact = ['javascript']
  let g:vsnip_filetypes.typescriptreact = ['typescript']
  let g:vsnip_filetypes.svelte = ['typescript', 'javascript']
]])



------------------------------------------------------
----- Setup lspconfig

local nvim_lsp = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp
                                                                     .protocol
                                                                     .make_client_capabilities())

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = {noremap = true, silent = true}

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>',
                   opts)
    buf_set_keymap('n', '<space>wa',
                   '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr',
                   '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl',
                   '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
                   opts)
    buf_set_keymap('n', '<space>D',
                   '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    -- buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', '<space>ca', '<cmd>CodeActionMenu<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>e',
                   '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>',
                   opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>',
                   opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>',
                   opts)
    buf_set_keymap('n', '<space>q',
                   '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>',
                   opts)

end

local servers = {
    'rust_analyzer', 'tsserver', 'svelte', 'tailwindcss', 'sumneko_lua'
}
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
        flags = {debounce_text_changes = 150}
    }
end

local system_name
if vim.fn.has("mac") == 1 then
    system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
    system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
    system_name = "Windows"
else
    print("Unsupported system for sumneko")
end

-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
local sumneko_root_path = os.getenv('HOME') .. '/Apps/lua-language-server'
local sumneko_binary = sumneko_root_path .. "/bin/" .. system_name ..
                           "/lua-language-server"

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require'lspconfig'.sumneko_lua.setup {
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = runtime_path
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'}
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true)
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {enable = false}
        }
    }
}



------------------------------------------------------
----- mfussenegger/nvim-dap
local dap = require('dap')
dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = {os.getenv('HOME') .. '/Apps/vscode-node-debug2/out/src/nodeDebug.js'},
}

vim.fn.sign_define('DapBreakpoint', {text='🟥', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='⭐️', texthl='', linehl='', numhl=''})

cmd([[
  nnoremap <leader>dh :lua require'dap'.toggle_breakpoint()<CR>
  nnoremap <S-k> :lua require'dap'.step_out()<CR>
  nnoremap <S-l> :lua require'dap'.step_into()<CR>
  nnoremap <S-j> :lua require'dap'.step_over()<CR>
  nnoremap <leader>ds :lua require'dap'.stop()<CR>
  nnoremap <leader>dn :lua require'dap'.continue()<CR>
  nnoremap <leader>dk :lua require'dap'.up()<CR>
  nnoremap <leader>dj :lua require'dap'.down()<CR>
  nnoremap <leader>d_ :lua require'dap'.disconnect();require'dap'.stop();require'dap'.run_last()<CR>
  nnoremap <leader>dr :lua require'dap'.repl.open({}, 'vsplit')<CR><C-w>l
  nnoremap <leader>di :lua require'dap.ui.variables'.hover()<CR>
  vnoremap <leader>di :lua require'dap.ui.variables'.visual_hover()<CR>
  nnoremap <leader>d? :lua require'dap.ui.variables'.scopes()<CR>
  nnoremap <leader>de :lua require'dap'.set_exception_breakpoints({"all"})<CR>
  nnoremap <leader>da :lua require'debugHelper'.attach()<CR>
  nnoremap <leader>dA :lua require'debugHelper'.attachToRemote()<CR>
  nnoremap <leader>di :lua require'dap.ui.widgets'.hover()<CR>
  nnoremap <leader>d? :lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR>
]])


------------------------------------------------------
----- Dap telescope
require('telescope').setup()
require('telescope').load_extension('dap')
cmd([[
  nnoremap <leader>df :Telescope dap frames<CR>
  nnoremap <leader>dc :Telescope dap commands<CR>
  nnoremap <leader>db :Telescope dap list_breakpoints<CR>
]])

------------------------------------------------------
----- virtual text
require("nvim-dap-virtual-text").setup()
-- let g:dap_virtual_text = v:true

------------------------------------------------------
----- David-Kunz/jester
cmd([[
  nnoremap <leader>tt :lua require"jester".run()<cr>
  nnoremap <leader>t_ :lua require"jester".run_last()<cr>
  nnoremap <leader>tf :lua require"jester".run_file()<cr>
  nnoremap <leader>dd :lua require"jester".debug()<cr>
  nnoremap <leader>d_ :lua require"jester".debug_last()<cr>
  nnoremap <leader>dF :lua require"jester".debug_file()<cr>
]])








