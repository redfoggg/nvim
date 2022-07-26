
return require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  -- Color scheme
  use { 'sainnhe/gruvbox-material' }
  use { 'joshdick/onedark.vim' }
  use { 'eddyekofo94/gruvbox-flat.nvim' }

  -- Readme preview
  use {
      'iamcco/markdown-preview.nvim',
      ft = 'markdown',
      run = 'cd app && yarn install'
    }

  -- Fuzzy finder
  use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }
  use {
    'lewis6991/gitsigns.nvim',
    requires = {'nvim-lua/plenary.nvim'},
    config = function() require('gitsigns').setup() end
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
       config = function() require'lualine'.setup{ options = { theme = 'gruvbox-flat' }} end
  }

  -- Barbar - buffer manager
  use {
      'romgrk/barbar.nvim',
      requires = {'kyazdani42/nvim-web-devicons'}
  }

  use {
      'nvim-lua/plenary.nvim'
  }

  use {
    "nvim-neorg/neorg",
    after = "nvim-treesitter",
    config = function()
        require('neorg').setup {
            load = {
                ["core.defaults"] = {},
                ["core.norg.dirman"] = {
                    config = {
                        workspaces = {
                            work = "~/notes/work",
                            home = "~/notes/home",
                        }
                    }
                },
                ["core.gtd.base"] = { 
                    config = { workspace = "home" }
                },
                ["core.norg.concealer"] = {}
            }
        }
    end,
    requires = "nvim-lua/plenary.nvim"
  }
  
  -- Elixir syntax
  use { 'elixir-editors/vim-elixir' }

  
  -- Vimspector - debugger for vim/nvim
  use {
      'puremourning/vimspector'
  }

end)
