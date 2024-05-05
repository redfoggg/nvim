return {
    "Olical/conjure",
    "tpope/vim-sexp-mappings-for-regular-people",
    "tpope/vim-surround",
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
    "nvim-lualine/lualine.nvim",
    "lukas-reineke/indent-blankline.nvim",
    {
        "eddyekofo94/gruvbox-flat.nvim",
        lazy = false,
        priority = 1000,
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
}
