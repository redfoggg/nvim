
return require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  -- Color scheme
  use { 'sainnhe/gruvbox-material' }

  -- Fuzzy finder
  use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

  -- CoC
  use {'neoclide/coc.nvim', branch = 'release'}

  -- Omnisharp - c# actions and functions
  use {'OmniSharp/omnisharp-vim'}

  -- Ale
  use { 'dense-analysis/ale' }

  -- Vim dispatch
  use { 'tpope/vim-dispatch' }

  -- Fugitive for Git
  use { 'tpope/vim-fugitive' }

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  
  -- File explorer
  use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons' -- optional, for file icon
      },
      config = function() require'nvim-tree'.setup{} end
  }

  -- Lualine - status line
  use {
      'nvim-lualine/lualine.nvim',
       requires = { 'kyazdani42/nvim-web-devicons', opt = true },
       config = function() require'lualine'.setup{} end
  }

  -- Barbar - buffer manager
  use {
      'romgrk/barbar.nvim',
      requires = {'kyazdani42/nvim-web-devicons'}
  }
  
  -- Elixir syntax
  use { 'elixir-editors/vim-elixir' }

  -- Start screen
  use {
      'mhinz/vim-startify'
  }
  
  -- Vimspector - debugger for vim/nvim
  use {
      'puremourning/vimspector'
  }

end)
