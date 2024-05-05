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
    "nvim-treesitter/nvim-treesitter-context",
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
        "eddyekofo94/gruvbox-flat.nvim",
        lazy = false,
        priority = 1000,
        name = "gruvbox-flat",
        config = function()
            function ColorMyPencils(color)
                color = color or "gruvbox-flat"
                vim.cmd.colorscheme(color)
                vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
                vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
            end

            ColorMyPencils()
            vim.cmd('highlight SignColumn guibg=NONE') -- desativa background na barra de ícones
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
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
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        -- setting the keybinding for LazyGit with 'keys' is recommended in
        -- order to load the plugin when the command is run for the first time
        keys = {
            { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
        }
    },
}
