return {
    {
        "m00qek/baleia.nvim",
        version = "*",
        config = function()
            vim.g.conjure_baleia = require("baleia").setup({ line_starts_at = 3 })

            vim.api.nvim_create_augroup("ConjureBaleia", { clear = true })

            vim.api.nvim_create_user_command("BaleiaColorize", function()
                vim.g.conjure_baleia.once(vim.api.nvim_get_current_buf())
            end, { bang = true })

            vim.api.nvim_create_user_command("BaleiaLogs", vim.g.conjure_baleia.logger.show, { bang = true })
        end
    },
    {
        "Olical/conjure",
        ft = { "clojure", "fennel" },
        config = function()
            require("conjure.main").main()
            require("conjure.mapping")["on-filetype"]()
            vim.g["conjure#mapping#doc_word"] = false
            vim.g["conjure#client#clojure#nrepl#test#current_form_names"] = { "deftest", "defflow", "defflow-br", "defspec", "defflow-i18n", "defflow-mx", "defflow-co" }
        end,
        init = function()
            -- Print color codes if baleia.nvim is available
            local colorize = require("lazy.core.config").spec.plugins["baleia.nvim"]
            vim.g["conjure#log#strip_ansi_escape_sequences_line_limit"] = colorize and 1 or nil

            -- Disable diagnostics in log buffer and colorize it
            vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
                pattern = "conjure-log-*",
                callback = function()
                    local buffer = vim.api.nvim_get_current_buf()
                    vim.diagnostic.enable(false, { bufnr = buffer })
                    if colorize and vim.g.conjure_baleia then
                        vim.g.conjure_baleia.automatically(buffer)
                    end
                end,
            })
        end
    },
    "tpope/vim-sexp-mappings-for-regular-people",
    {
        "redfoggg/vim-sexp-fork-without-alt-binds",
        config = function()
            local meh_key = "<M-S-C-"
            local meh_with_leader = "<LocalLeader>" .. meh_key
            local opts = { noremap = false }

            vim.keymap.set({ "n", "v" }, meh_with_leader .. "k>", "<Plug>(sexp_swap_list_backward)", opts)
            vim.keymap.set({ "n", "v" }, meh_with_leader .. "j>", "<Plug>(sexp_swap_list_forward)", opts)
            vim.keymap.set({ "n", "v" }, meh_with_leader .. "h>", "<Plug>(sexp_swap_element_backward)", opts)
            vim.keymap.set({ "n", "v" }, meh_with_leader .. "l>", "<Plug>(sexp_swap_element_forward)", opts)
            vim.keymap.set({ "n", "v" }, meh_key .. "j>", "<Plug>(sexp_emit_head_element)", opts)
            vim.keymap.set({ "n", "v" }, meh_key .. "k>", "<Plug>(sexp_emit_tail_element)", opts)
            vim.keymap.set({ "n", "v" }, meh_key .. "h>", "<Plug>(sexp_capture_prev_element)", opts)
            vim.keymap.set({ "n", "v" }, meh_key .. "l>", "<Plug>(sexp_capture_next_element)", opts)
        end
    },
    {
        "clojure-vim/vim-jack-in",
        dependencies = { "radenling/vim-dispatch-neovim" },
    },
}
