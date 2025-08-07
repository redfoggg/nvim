return {
    "tpope/vim-surround",
    "tpope/vim-dispatch",
    "tpope/vim-repeat",
    {
        "3rd/image.nvim",
        build = false,
        opts = {
            processor = "magick_cli",
        }
    },
    "numToStr/Comment.nvim",
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
    "laytan/cloak.nvim",
    "HiPhish/rainbow-delimiters.nvim",
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require('lualine').setup({
                options = {
                    globalstatus = true
                }
            })
        end
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup({
                current_line_blame_opts = {
                    delay = 300
                },
            })
        end,
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    {
        'folke/lazydev.nvim',
        ft = 'lua',
        opts = {
            library = {
                -- Load luvit types when the `vim.uv` word is found
                { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
            },
        },
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
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        keys = {
            { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
        }
    },
    {
        'echasnovski/mini.nvim',
        version = false,
        config = function()
            require('mini.files').setup()
            require('mini.pairs').setup()
        end,
        keys = {
            { "<leader>pv", "<cmd>lua MiniFiles.open()<cr>", desc = "MiniFiles open tab buffer" }
        },
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
        },
    },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {},
        keys = {
            { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
            { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
            { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
            { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
        },
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {},
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
    },
    "nvim-treesitter/nvim-treesitter-context",
    "nvim-treesitter/nvim-treesitter-textobjects",
    "nvim-treesitter/playground",
    {
        "junegunn/vim-easy-align",
        keys = {
            { "={", "vi{<C-v>$:EasyAlign\\ g/^\\S/<CR>" },
            { "=[", "vi[<C-v>$:EasyAlign\\ g/^\\S/<CR>" },
            { "=(", "vi(<C-v>$:EasyAlign\\ g/^\\S/<CR>" },
        },
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && yarn install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
        keys = {
            { "<leader>mp", "<cmd>MarkdownPreview<cr>", desc = "Markdown Preview" }
        }
    },
}
