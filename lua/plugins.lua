
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

  -- Surround
  use({
      "kylechui/nvim-surround",
      config = function()
          require("nvim-surround").setup()
      end
  })

  -- Nvim-commenter
  use {
      'numToStr/Comment.nvim',
      config = function()
          require('Comment').setup()
      end
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

  -- LspExtensions
  use { 'Hoffs/omnisharp-extended-lsp.nvim' }
  use { 'onsails/lspkind-nvim' }

  -- LspCompletion
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-path' }
  use { 'L3MON4D3/LuaSnip' }
  use { 'saadparwaiz1/cmp_luasnip' }
  use { "rafamadriz/friendly-snippets" }

  -- LspManager
  use { 'williamboman/mason.nvim' }
  use { 'williamboman/mason-lspconfig.nvim' }

  -- LspConfig
  use { 'neovim/nvim-lspconfig' }


  -- Vim dispatch
  use { 'tpope/vim-dispatch' }

  -- Fugitive for Git
  use { 'tpope/vim-fugitive' }

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  
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
                ["core.keybinds"] = {
                    config = { 
                        default_keybinds = true,
                        neorg_leader = "<Leader>n"
                    }
                },
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
  
  -- debugger for nvim
  use { 'puremourning/vimspector' }

  -- TODO: Make it work with nvim-dap
  --[[ use { "mfussenegger/nvim-dap" }
  use { "theHamsta/nvim-dap-virtual-text" }
  use { "nvim-telescope/telescope-dap.nvim" }
  use { "rcarriga/nvim-dap-ui" } ]]

end)
