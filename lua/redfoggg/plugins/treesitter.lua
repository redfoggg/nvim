return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    branch = "main",
    config = function()
        vim.api.nvim_create_autocmd("FileType", {
            callback = function()
                -- Try to start treesitter for the current buffer
                -- pcall prevents errors if no parser is available for the filetype
                pcall(vim.treesitter.start)
            end,
        })
    end
}
