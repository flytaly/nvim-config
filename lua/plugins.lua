-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'kana/vim-textobj-user' -- create your own text objects
  use 'kana/vim-textobj-entire' -- select entire buffer
  use 'szw/vim-maximizer' -- maximize and restore windows
  use 'nvim-lua/plenary.nvim' -- useful lua functions
  use 'unblevable/quick-scope' -- highlight unique chars
  use 'lewis6991/gitsigns.nvim'
  use 'nvim-lua/popup.nvim'
  use 'nvim-lualine/lualine.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'phaazon/hop.nvim'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-surround'
  use 'unblevable/quick-scope'
  use 'sindrets/diffview.nvim'
  use 'lyokha/vim-xkbswitch' --- switch from RU -> EN automatically

  -- consistent navigation between vim and terminal splits
  use {'knubie/vim-kitty-navigator', run = 'cp ./*.py ~/.config/kitty/' }

  ------- Themes and styles
  -- use 'shaunsingh/nord.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'folke/tokyonight.nvim'

  -------------------------
  ------- Programming utils
  use 'sheerun/vim-polyglot'
  use 'evanleck/vim-svelte'
  use 'tpope/vim-commentary'
  use 'mhartington/formatter.nvim'
  use 'neovim/nvim-lspconfig'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'weilbith/nvim-code-action-menu'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'

  -- debug
  use 'mfussenegger/nvim-dap'
  use 'nvim-telescope/telescope-dap.nvim'
  use 'theHamsta/nvim-dap-virtual-text'
  use 'david-kunz/jester'


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)




