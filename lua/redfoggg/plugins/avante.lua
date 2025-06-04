return {
    {
        "zbirenbaum/copilot.lua",
        config = function()
            require('copilot').setup({
                suggestion = {
                    enabled = true,
                    auto_trigger = true,
                    debounce = 75,
                },
                panel = {
                    enabled = true,
                },
                filetypes = {
                    markdown = true,
                    help = true,
                },
            })
        end
    },
    {
        "yetone/avante.nvim",
        event = "VeryLazy",
        version = false,
        opts = {

            providers = {
                copilot = {
                    model = "claude-sonnet-4"
                },
                ollama = {
                    model = "codellama:7b"
                },
            },
            provider = "copilot",
        },
        build = "make",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "stevearc/dressing.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            --- The below dependencies are optional,
            "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
            "hrsh7th/nvim-cmp",              -- autocompletion for avante commands and mentions
            "nvim-tree/nvim-web-devicons",   -- or echasnovski/mini.icons
            {
                -- support for image pasting
                "HakonHarnes/img-clip.nvim",
                event = "VeryLazy",
                opts = {
                    -- recommended settings
                    default = {
                        embed_image_as_base64 = false,
                        prompt_for_file_name = false,
                        drag_and_drop = {
                            insert_mode = true,
                        },
                    },
                },
            },
            {
                'MeanderingProgrammer/render-markdown.nvim',
                opts = {
                    file_types = { "markdown", "Avante" },
                    render_modes = true,
                    sign = {
                        enabled = false
                    },
                },
                dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
                ft = { "markdown", "Avante" },
            },
        },
    } }
