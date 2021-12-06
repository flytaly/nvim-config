-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'kana/vim-textobj-user' -- create your own text objects
  use 'kana/vim-textobj-entire' -- select entire buffer
  use 'nvim-lua/plenary.nvim' -- useful lua functions
  use 'unblevable/quick-scope' -- highlight unique chars
  use 'nvim-lua/popup.nvim'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-surround'

  use {
    'sindrets/diffview.nvim',
    config = function() require 'config.plugins.diffview' end
  }

  use { -- maximize and restore windows
    'szw/vim-maximizer',
    config = function() require 'config.plugins.vim-maximizer' end
  }

  use {
    'lewis6991/gitsigns.nvim',
    config = function () require'gitsigns'.setup() end
  }

  use {
    'nvim-lualine/lualine.nvim',
    config = function () require'config.plugins.lualine' end
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} },
    config = function () require('config.plugins.telescope')
    end
  }

  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}

  use {
    'phaazon/hop.nvim', -- easy-motion alternative
    config = function() require 'config.plugins.hop' end
  }

  use { 'luukvbaal/nnn.nvim', config = function ()  require'config.plugins.nnn' end }

  use {
    'lyokha/vim-xkbswitch', --- switch from RU -> EN automatically
    config = function () require 'config.plugins.vim-xkbswitch' end
  }

  -- consistent navigation between vim and terminal splits
  use {'knubie/vim-kitty-navigator', run = 'cp ./*.py ~/.config/kitty/' }

  ------- Themes and styles
  -- use 'shaunsingh/nord.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'folke/tokyonight.nvim'

  use { 'norcalli/nvim-colorizer.lua', config = function ()
    local conf = { css_fn = true; css = true }
    require'colorizer'.setup({ 'svelte', 'html', 'css', }, conf)
  end }

  -------------------------
  ------- Programming utils
  use 'sheerun/vim-polyglot'
  -- use 'evanleck/vim-svelte'
  use {'leafOfTree/vim-svelte-plugin',
    config = function ()
      vim.g.vim_svelte_plugin_use_typescript = 1
    end
  }
  use 'tpope/vim-commentary'
  use 'mhartington/formatter.nvim'
  use 'jose-elias-alvarez/nvim-lsp-ts-utils'
  use 'jose-elias-alvarez/null-ls.nvim'

  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'

  use { -- show function signature when you type
    'ray-x/lsp_signature.nvim',
    config = function () require'config.plugins.lsp_signature' end
  }

  use 'nvim-lua/lsp-status.nvim' -- genere statusline components from the LSP client.

  use { -- a code outline window for skimming and quick navigation
    'stevearc/aerial.nvim',
    config = function() require('config.plugins.aerial-nvim') end
  }

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'weilbith/nvim-code-action-menu',
    config = function ()
      -- Disable diff until the issue is open
      -- https://github.com/weilbith/nvim-code-action-menu/issues/32
      vim.g.code_action_menu_show_diff = false
  end }
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use { 'hrsh7th/vim-vsnip', config = function () require'config.plugins.vim-vsnip' end }
  use 'hrsh7th/vim-vsnip-integ'
  use 'hrsh7th/cmp-vsnip'
  use { 'hrsh7th/nvim-cmp', config = function () require 'config.plugins.nvim-cmp' end }

  -- debug
  use 'mfussenegger/nvim-dap'
  use 'nvim-telescope/telescope-dap.nvim'
  use { 'theHamsta/nvim-dap-virtual-text', config = function () require("nvim-dap-virtual-text").setup() end }

  -- tests
  use { 'david-kunz/jester', config = function () require('config.plugins.jester') end }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)




