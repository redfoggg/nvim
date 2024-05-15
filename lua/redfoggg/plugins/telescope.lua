return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        { "<C-p>",       function() require('telescope.builtin').find_files() end },
        { "<leader>pf",  function() require('telescope.builtin').git_files() end },
        { "<leader>ps",  function() require('telescope.builtin').live_grep() end, },
        { "<leader>vh",  function() require('telescope.builtin').help_tags() end },
        { "<leader>kmh", function() require('telescope.builtin').keymaps() end },
    },
}
