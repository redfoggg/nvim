return {
    "Hoffs/omnisharp-extended-lsp.nvim",
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        dependencies = {
            -- LSP Support
            'neovim/nvim-lspconfig',
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
            local lsp_zero = require("lsp-zero")
            local lspkind = require("lspkind")

            lsp_zero.preset("recommended")

            -- inlayhints para lsp que suportam
            -- vim.api.nvim_create_autocmd("LspAttach", {
            --     group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            --     callback = function(args)
            --         local client = vim.lsp.get_client_by_id(args.data.client_id)
            --         if client ~= nil and client.server_capabilities.inlayHintProvider then
            --             vim.lsp.inlay_hint.enable(args.buf, true)
            --         end
            --     end
            -- })

            lsp_zero.set_server_config({
                on_init = function(client)
                    client.server_capabilities.semanticTokensProvider = nil
                end,
            })

            local dotnetConfig = {
                handlers = {
                    ["textDocument/definition"] = require('omnisharp_extended').handler
                }
            }
            require('lspconfig').omnisharp.setup(dotnetConfig)

            local cmp = require('cmp')
            local cmp_select = { behavior = cmp.SelectBehavior.Insert }
            local cmp_mappings = lsp_zero.defaults.cmp_mappings({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-y>'] = cmp.mapping(
                    cmp.mapping.confirm {
                        select = true,
                        behavior = cmp.ConfirmBehavior.Insert
                    },
                    { "i", "c" }),
                ["<C-Space>"] = cmp.mapping.complete(),
            })

            -- TODO essa parte precisa ser removida para
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

            lsp_zero.set_sign_icons({
                error = '',
                warn = '',
                hint = '',
                info = ''
            })

            lsp_zero.on_attach(function(client, bufnr)
                local opts = { buffer = bufnr, remap = false }

                -- por algum motivo é necessário chamar desta forma para que funcione
                -- a config do handler não funciona com o lsp-zero como funcionava
                -- com o lsp-config, preguiça de olhar o que é agora, quem sabe daqui a
                -- alguns anos
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
            end)

            lsp_zero.setup()

            vim.diagnostic.config({ virtual_text = true })
            vim.diagnostic.config {
                virtual_text = {
                    prefix = ''
                },
            }

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
                        require('lspconfig')[server_name].setup({})
                        require('lspconfig')["dartls"].setup({})
                    end,
                    ["lua_ls"] = function()
                        local lspconfig = require("lspconfig")
                        lspconfig.lua_ls.setup {
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
