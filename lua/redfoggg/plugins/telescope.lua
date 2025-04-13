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
        { "<C-p>",       function() require('telescope.builtin').find_files() end },
        { "<leader>pf",  function() require('telescope.builtin').git_files() end },
        { "<leader>ps",  function() require('telescope.builtin').live_grep() end, },
        { "<leader>vh",  function() require('telescope.builtin').help_tags() end },
        { "<leader>kmh", function() require('telescope.builtin').keymaps() end },
    },
}
