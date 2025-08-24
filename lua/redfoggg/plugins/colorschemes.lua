return {
    "olimorris/onedarkpro.nvim",
    "folke/tokyonight.nvim",
    "rebelot/kanagawa.nvim",
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("catppuccin")
            vim.cmd('highlight SignColumn guibg=NONE')     -- desativa background na barra de ícones
        end
    }
}
