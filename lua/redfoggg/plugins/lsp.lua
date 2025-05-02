return {
    "Hoffs/omnisharp-extended-lsp.nvim",
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            -- LSP Support
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',

            -- Autocompletion
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lua',

            -- Snippets
            'L3MON4D3/LuaSnip',
            'rafamadriz/friendly-snippets',
            "saadparwaiz1/cmp_luasnip",

            -- Só para ícones mesmo
            "onsails/lspkind.nvim",
        },
        config = function()
            local lspkind = require("lspkind")

            local dotnetConfig = {
                handlers = {
                    ["textDocument/definition"] = require('omnisharp_extended').handler
                }
            }
            require('lspconfig').omnisharp.setup(dotnetConfig)

            local cmp = require('cmp')
            local cmp_select = { behavior = cmp.SelectBehavior.Insert }
            local cmp_mappings = {
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-y>'] = cmp.mapping(
                    cmp.mapping.confirm {
                        select = true,
                        behavior = cmp.ConfirmBehavior.Insert
                    },
                    { "i", "c" }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }

            -- TODO: essa parte precisa ser removida para
            -- reorganizar o completion fora do local onde
            -- é organizado o lsp como está aqui tudo misturado
            cmp_mappings['<Tab>'] = nil
            cmp_mappings['<S-Tab>'] = nil

            cmp.setup({
                mapping = cmp_mappings,
                sources = cmp.config.sources({
                        { name = "nvim_lsp" },
                        { name = "luasnip" }
                    },
                    {
                        { name = "buffer" }
                    }
                ),
                formatting = {
                    format = lspkind.cmp_format({
                        mode = 'symbol',
                        maxwidth = 50,
                        ellipsis_char = '...',
                        show_labelDetails = true,
                    })
                },
            })

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
                    vim.keymap.set("n", "gd", function() require('omnisharp_extended').lsp_definitions() end, opts)
                else
                    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
                end

                vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
                vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
                vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
                vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
                vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
                vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
                vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
                vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
                vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
                vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
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

            require('mason').setup({})
            require('mason-lspconfig').setup({
                ensure_installed = {
                    'rust_analyzer',
                    'omnisharp',
                    'clojure_lsp',
                    'lua_ls'
                },
                handlers = {
                    function(server_name)
                        require('lspconfig')[server_name].setup({
                            on_attach = on_attach
                        })
                        require('lspconfig')['hls'].setup {
                            on_attach = on_attach,
                            filetypes = { 'haskell', 'lhaskell', 'cabal' },
                        }
                    end,
                    ["lua_ls"] = function()
                        local lspconfig = require("lspconfig")
                        lspconfig.lua_ls.setup {
                            on_attach = on_attach,
                            settings = {
                                Lua = {
                                    runtime = { version = "Lua 5.1" },
                                    diagnostics = {
                                        globals = { "vim", "it", "describe", "before_each", "after_each" },
                                    }
                                }
                            }
                        }
                    end,
                },
            })
        end,
    },
}
