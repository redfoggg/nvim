return {
    "tpope/vim-surround",
    "tpope/vim-dispatch",
    "tpope/vim-repeat",
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
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("catppuccin")
            vim.cmd('highlight SignColumn guibg=NONE') -- desativa background na barra de ícones
        end
    },
    { "folke/tokyonight.nvim" },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end,
        dependencies = { "nvim-lua/plenary.nvim" }
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
        "github/copilot.vim",
        cmd = "Copilot",
        keys = {
            { "<leader>ct", "<cmd>lua ToggleCopilot()<cr>", desc = "Toggle Copilot" }
        }
    },
    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
        ft = { "markdown", "codecompanion" },
        opts = {
            render_modes = true,
            sign = {
                enabled = false
            },
        },
    },
    {
        "olimorris/codecompanion.nvim",
        config = true,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        keys = {
            { "<leader>cc", "<cmd>CodeCompanionChat toggle<cr>", desc = "Toggle CodeCompanionChat" },
            { "<leader>cp", "<cmd>CodeCompanionChat<cr>",        desc = "Open CodeCompanionChat" }
        },
        opts = {
            strategies = {
                chat = {
                    adapter = "copilot",
                    slash_commands = {
                        ["buffer"] = {
                            opts = {
                                provider = "telescope",
                                contains_code = true
                            }
                        },
                        ["file"] = {
                            opts = {
                                provider = "telescope",
                                contains_code = true
                            }
                        }
                    }
                },
                inline = { adapter = "copilot" },
            },
            adapters = {
                copilot = function()
                    return require("codecompanion.adapters").extend("copilot", {
                        schema = {
                            model = {
                                default = "claude-3.5-sonnet",
                            },
                        },
                    })
                end,
            }
        }
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
}
