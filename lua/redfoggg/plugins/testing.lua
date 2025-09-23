return {
    "nvim-neotest/neotest",
    commit = "52fca6717ef972113ddd6ca223e30ad0abb2800c",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",
        "rcasia/neotest-java",
        "Issafalcon/neotest-dotnet",
        "mfussenegger/nvim-jdtls",
        "mfussenegger/nvim-dap",
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
    },
    lazy = true,
    config = function()
        require("neotest").setup({
            adapters = {
                require("neotest-java")({}),
                require("neotest-dotnet")({}),
            },
        })
    end
}
