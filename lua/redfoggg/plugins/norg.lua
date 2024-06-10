return {
    {
        "vhyrro/luarocks.nvim",
        priority = 1000,
        config = true,
    },
    {
        "nvim-neorg/neorg",
        dependencies = { "luarocks.nvim" },
        lazy = false,
        version = "*",
        config = function()
            require("neorg").setup({
                load = {
                    ["core.defaults"] = {},
                    ["core.concealer"] = {},
                    ["core.summary"] = {},
                    ["core.completion"] = { config = { engine = "nvim-cmp", name = "[Norg]" } },
                    ["core.keybinds"] = {
                        config = {
                            default_keybinds = true,
                            neorg_leader = "<Leader><Leader>"
                        }
                    },
                    ["core.dirman"] = {
                        config = {
                            workspaces = {
                                notes = "~/notes",
                            },
                            default_workspace = "notes"
                        },
                    },
                },
            })
            vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
              pattern = {"*.norg"},
              command = "set conceallevel=3"
            })
        end,
    },
}
