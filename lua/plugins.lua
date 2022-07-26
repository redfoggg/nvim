
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

  -- Git
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
  
  -- Elixir syntax
  use { 'elixir-editors/vim-elixir' }

  -- Start screen / currently without it
  
  -- Vimspector - debugger for vim/nvim
  use {
      'puremourning/vimspector'
  }

  -- Neorg - Neovim org mode
  use {
    "nvim-neorg/neorg",
    after = "nvim-treesitter",
    config = function()
        require('neorg').setup{
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
                ["core.norg.concealer"] = {},
                ["core.gtd.base"] = {
                    config = {
                        workspace = "work",
                        displayers = {
                            projects = {
                                show_completed_projects = true,
                                show_projects_without_tasks = true
                            }
                        }
                    }
                },
            }
        }
    end,
    requires = "nvim-lua/plenary.nvim"
  }

end)
