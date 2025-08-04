return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local ignore_patterns = {
            "deps/.*",
            "_build/.*",
            ".elixir_ls/.*",
            "assets/node_modules/.*",
            "priv/static/.*",
            "cover/.*"
        }
        require "telescope".setup {
            pickers = {
                find_files = {
                    previewer = false,
                    file_ignore_patterns = ignore_patterns
                },
                git_files = {
                    previewer = false,
                    file_ignore_patterns = ignore_patterns
                },
                live_grep = {
                    file_ignore_patterns = ignore_patterns
                }
            }
        }
    end,
    keys = {
        { "<leader>ff",  function() require('telescope.builtin').find_files() end, desc = "Find files" },
        { "<leader>pf",  function() require('telescope.builtin').git_files() end,  desc = "Find git files" },
        { "<leader>ps",  function() require('telescope.builtin').live_grep() end,  desc = "Live grep" },
        { "<leader>vh",  function() require('telescope.builtin').help_tags() end,  desc = "Help tags" },
        { "<leader>kmh", function() require('telescope.builtin').keymaps() end,    desc = "Keymaps" },
    },
}
