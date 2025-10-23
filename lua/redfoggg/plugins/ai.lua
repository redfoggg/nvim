return {
    {
        "zbirenbaum/copilot.lua",
        lazy = false,
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
        end,
        keys = {
            {
                "<M-l>",
                function()
                    require('copilot.suggestion').accept()
                end,
                mode = "i",
                desc = "Accept Copilot suggestion"
            },
        },
    },
    {
        "editor-code-assistant/eca-nvim",
        dependencies = {
            "MunifTanjim/nui.nvim",  -- Required: UI framework
            "nvim-lua/plenary.nvim", -- Optional: Enhanced async operations
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
                ft = { "markdown" },
            },
        },
        keys = {
            { "<leader>ec",  "<cmd>EcaChat<cr>",         desc = "Open ECA chat" },
            { "<leader>ef",  "<cmd>EcaFocus<cr>",        desc = "Focus ECA sidebar" },
            { "<leader>et",  "<cmd>EcaToggle<cr>",       desc = "Toggle ECA sidebar" },
            { "<leader>eaf", "<cmd>EcaAddFile<cr>",      desc = "ECA add file" },
            { "<leader>eas", "<cmd>EcaAddSeleciton<cr>", desc = "ECA add selection" },
        },
        opts = {
            debug = false,
            server_path = "",
            behaviour = {
                auto_set_keymaps = true,
                auto_focus_sidebar = true,
            },
        }
    },
    -- {
    --     "copilotlsp-nvim/copilot-lsp",
    --     init = function()
    --         vim.g.copilot_nes_debounce = 500
    --         vim.lsp.enable("copilot_ls")
    --         vim.keymap.set("n", "<tab>", function()
    --             local bufnr = vim.api.nvim_get_current_buf()
    --             local state = vim.b[bufnr].nes_state
    --             if state then
    --                 -- Try to jump to the start of the suggestion edit.
    --                 -- If already at the start, then apply the pending suggestion and jump to the end of the edit.
    --                 local _ = require("copilot-lsp.nes").walk_cursor_start_edit()
    --                     or (
    --                         require("copilot-lsp.nes").apply_pending_nes()
    --                         and require("copilot-lsp.nes").walk_cursor_end_edit()
    --                     )
    --                 return nil
    --             else
    --                 -- Resolving the terminal's inability to distinguish between `TAB` and `<C-i>` in normal mode
    --                 return "<C-i>"
    --             end
    --         end, { desc = "Accept Copilot NES suggestion", expr = true })
    --         -- Clear copilot suggestion with Esc if visible, otherwise preserve default Esc behavior
    --         vim.keymap.set("n", "<esc>", function()
    --             if not require('copilot-lsp.nes').clear() then
    --             end
    --         end, { desc = "Clear Copilot suggestion or fallback" })
    --     end,
    -- },
}
