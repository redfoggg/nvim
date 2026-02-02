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
        { "<leader>sh",  function() require('telescope.builtin').help_tags() end,      desc = "[S]earch [H]elp" },
        { "<leader>sk",  function() require('telescope.builtin').keymaps() end,        desc = "[S]earch [K]eymaps" },
        { "<leader>sf",  function() require('telescope.builtin').find_files() end,     desc = "[S]earch [F]iles" },
        { "<leader>sp",  function() require('telescope.builtin').git_files() end,      desc = "[S]earch [P]roject(Git) [F]iles" },
        { "<leader>ss",  function() require('telescope.builtin').builtin() end,        desc = "[S]earch [S]elect Telescope" },
        { "<leader>sw",  function() require('telescope.builtin').grep_string() end,    desc = "[S]earch current [W]ord" },
        { "<leader>sg",  function() require('telescope.builtin').live_grep() end,      desc = "[S]earch by [G]rep" },
        { "<leader>sd",  function() require('telescope.builtin').diagnostics() end,    desc = "[S]earch [D]iagnostics" },
        { "<leader>sr",  function() require('telescope.builtin').resume() end,         desc = "[S]earch [R]esume" },
        { "<leader>s.",  function() require('telescope.builtin').oldfiles() end,       desc = "[S]earch Recent Files (\".\" for repeat)" },
        { "<leader>slr", function() require('telescope.builtin').lsp_references() end, desc = "[S]earch [L]sp [R]eference" },
        { "<leader>sb",  function() require('telescope.builtin').buffers() end,        desc = "[S]earch [B]uffers" },
    },
}
