return {
    {
        "Olical/conjure",
        config = function()
            vim.g["conjure#mapping#doc_word"] = false
        end
    },
    "tpope/vim-sexp-mappings-for-regular-people",
    "tpope/vim-surround",
    "tpope/vim-dispatch",
    "tpope/vim-repeat",
    "guns/vim-sexp",
    "numToStr/Comment.nvim",
    {
        "clojure-vim/vim-jack-in",
        dependencies = { "radenling/vim-dispatch-neovim" },
    },
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            "nvim-neotest/nvim-nio"
        },
    },
    "mbbill/undotree",
    "theprimeagen/refactoring.nvim",
    "laytan/cloak.nvim",
    "HiPhish/rainbow-delimiters.nvim",
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require('lualine').setup()
        end
    },
    "lukas-reineke/indent-blankline.nvim",
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("catppuccin")
            vim.cmd('highlight SignColumn guibg=NONE') -- desativa background na barra de ícones
        end
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end,
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    {
        "kdheepak/lazygit.nvim",
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        keys = {
            { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
        }
    },
    {
        'echasnovski/mini.nvim',
        version = false,
        config = function()
            require('mini.files').setup()
            require('mini.pairs').setup()
        end,
        keys = {
            { "<leader>pv", "<cmd>lua MiniFiles.open()<cr>", desc = "MiniFiles open tab buffer" }
        },
    },
    {
        "jinh0/eyeliner.nvim",
        config = function()
            require 'eyeliner'.setup {
                highlight_on_key = true,
                dim = true,
            }
        end

    },
    {
        "github/copilot.vim",
        cmd = "Copilot"
    },
    {
        'MeanderingProgrammer/markdown.nvim',
        main = "render-markdown",
        opts = {},
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
        },
    },
    "nvim-treesitter/nvim-treesitter-context",
    "nvim-treesitter/nvim-treesitter-textobjects",
    "nvim-treesitter/playground",
}
