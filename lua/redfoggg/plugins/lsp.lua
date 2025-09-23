return {
    {
        "seblyng/roslyn.nvim",
        ft = "cs"
    },
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            -- LSP Support
            'mason-org/mason.nvim',
            'mason-org/mason-lspconfig.nvim',

            -- Snippets
            'L3MON4D3/LuaSnip',
            'rafamadriz/friendly-snippets',
        },
        config = function()
            local capabilities = vim.lsp.protocol.make_client_capabilities()

            capabilities = vim.tbl_deep_extend('force', capabilities,
                require('blink.cmp').get_lsp_capabilities({}, false))

            capabilities = vim.tbl_deep_extend('force', capabilities, {
                textDocument = {
                    foldingRange = {
                        dynamicRegistration = false,
                        lineFoldingOnly = true
                    }
                }
            })

            --capabilities.textDocument.semanticTokens = nil

            vim.diagnostic.config({
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = '',
                        [vim.diagnostic.severity.WARN] = '',
                        [vim.diagnostic.severity.INFO] = '',
                        [vim.diagnostic.severity.HINT] = '󰌵',
                    },
                },
                virtual_text = {
                    prefix = ''
                },
            })


            local on_attach = function(client, bufnr)
                --client.server_capabilities.semanticTokensProvider = nil
                local opts = { buffer = bufnr, remap = false }

                vim.lsp.inlay_hint.enable(true)

                if client.name == "omnisharp" then
                    vim.keymap.set("n", "gd", require('omnisharp_extended').lsp_definitions, opts,
                        { desc = "Go to definition" })
                else
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts, { desc = "Go to definition" })
                end

                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts, { desc = "Go to declaration" })
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts, { desc = "Go to implementation" })
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts, { desc = "Show hover information" })
                vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts,
                    { desc = "Search workspace symbols" })
                vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts, { desc = "Open diagnostics in float" })
                vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts, { desc = "Go to next diagnostic" })
                vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts, { desc = "Go to previous diagnostic" })
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts, { desc = "Code action" })
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts, { desc = "Rename symbol" })
                vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts, { desc = "Show signature help" })
            end

            local ls = require "luasnip"
            ls.config.set_config {
                history = false,
                updateevents = "TextChanged,TextChangedI",
            }

            vim.lsp.config("*", {
                on_attach = on_attach,
                capabilities = capabilities,
            })

            vim.lsp.config("lua_ls", {
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    Lua = {
                        runtime = { version = "Lua 5.1" },
                        diagnostics = {
                            globals = { "vim", "it", "describe", "before_each", "after_each" },
                        }
                    }
                }
            })

            vim.lsp.config("roslyn", {
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    ["csharp|inlay_hints"] = {
                        csharp_enable_inlay_hints_for_implicit_object_creation = true,
                        csharp_enable_inlay_hints_for_implicit_variable_types = true,
                    },
                    ["csharp|code_lens"] = {
                        dotnet_enable_references_code_lens = true,
                    },
                },
            })
            vim.lsp.enable('roslyn') -- é preciso botar esse já que o Mason não tem suporte a este lsp

            require('mason').setup({
                registries = {
                    "github:mason-org/mason-registry",
                    "github:Crashdummyy/mason-registry",
                },
            })
            require("mason-lspconfig").setup() -- basicamente para garantir que o vim.lsp.enable({'clang', 'lua_ls'}) etc, rode para todos lsp's instalados
        end,
    },
}
