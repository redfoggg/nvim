return {
    {
        "seblyng/roslyn.nvim",
        ft = "cs"
    },
    "Hoffs/omnisharp-extended-lsp.nvim",
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            -- LSP Support
            'mason-org/mason.nvim',
            'mason-org/mason-lspconfig.nvim',

            -- Snippets
            'L3MON4D3/LuaSnip',
            'rafamadriz/friendly-snippets',
            "saadparwaiz1/cmp_luasnip",
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
                client.server_capabilities.semanticTokensProvider = nil
                local opts = { buffer = bufnr, remap = false }

                if client.name == "omnisharp" then
                    vim.keymap.set("n", "gd", require('omnisharp_extended').lsp_definitions, opts)
                else
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                end

                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
                vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
                vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
                vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
            end

            local ls = require "luasnip"
            ls.config.set_config {
                history = false,
                updateevents = "TextChanged,TextChangedI",
            }
            vim.keymap.set({ "i", "s" }, "<c-k>", function()
                if ls.expand_or_jumpable() then
                    ls.expand_or_jump()
                end
            end, { silent = true })

            vim.keymap.set({ "i", "s" }, "<c-j>", function()
                if ls.jumpable(-1) then
                    ls.jump(-1)
                end
            end, { silent = true })

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
