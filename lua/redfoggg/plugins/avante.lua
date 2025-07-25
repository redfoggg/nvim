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
        "copilotlsp-nvim/copilot-lsp",
        init = function()
            vim.g.copilot_nes_debounce = 500
            vim.lsp.enable("copilot_ls")
            vim.keymap.set("n", "<tab>", function()
                local _ = require("copilot-lsp.nes").walk_cursor_start_edit()
                    or (
                        require("copilot-lsp.nes").apply_pending_nes() and require("copilot-lsp.nes").walk_cursor_end_edit()
                    )
            end)
        end,
    },
    {
        "yetone/avante.nvim",
        event = "VeryLazy",
        version = false,
        opts = {
            providers = {
                copilot = {
                    model = "gpt-4.1"
                },
                ollama = {
                    model = "codellama:7b"
                },
            },
            provider = "copilot",
            windows = {
                width = 40,
            },
        },
        config = function()
            require("avante").setup({
                system_prompt = function()
                    local hub = require("mcphub").get_hub_instance()
                    return hub and hub:get_active_servers_prompt() or ""
                end,
                custom_tools = function()
                    return {
                        require("mcphub.extensions.avante").mcp_tool(),
                    }
                end,
            })
        end,
        build = "make",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "stevearc/dressing.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-telescope/telescope.nvim",
            "hrsh7th/nvim-cmp",
            "nvim-tree/nvim-web-devicons",
            {
                "HakonHarnes/img-clip.nvim",
                event = "VeryLazy",
                opts = {
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
