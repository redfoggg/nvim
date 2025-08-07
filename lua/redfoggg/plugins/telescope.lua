local builtin = require('telescope.builtin')

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
        { "<leader>sh",  function() builtin.help_tags() end,   desc = "[S]earch [H]elp" },
        { "<leader>sk",  function() builtin.keymaps() end,     desc = "[S]earch [K]eymaps" },
        { "<leader>sf",  function() builtin.find_files() end,  desc = "[S]earch [F]iles" },
        { "<leader>sgf", function() builtin.git_files() end,   desc = "[S]earch [G]it [F]iles" },
        { "<leader>ss",  function() builtin.builtin() end,     desc = "[S]earch [S]elect Telescope" },
        { "<leader>sw",  function() builtin.grep_string() end, desc = "[S]earch current [W]ord" },
        { "<leader>sg",  function() builtin.live_grep() end,   desc = "[S]earch by [G]rep" },
        { "<leader>sd",  function() builtin.diagnostics() end, desc = "[S]earch [D]iagnostics" },
        { "<leader>sr",  function() builtin.resume() end,      desc = "[S]earch [R]esume" },
        { "<leader>s.",  function() builtin.oldfiles() end,    desc = "[S]earch Recent Files (\".\" for repeat)" },
        { "<leader>sb",  function() builtin.buffers() end,     desc = "[S]earch [B]uffers" },
    },
}
