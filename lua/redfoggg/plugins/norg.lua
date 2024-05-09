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
        build = function()
            local shell = require 'nvim-treesitter.shell_command_selectors'
            local install = require 'nvim-treesitter.install'

            -- save the original functions
            local select_executable = shell.select_executable
            local compilers = install.compilers

            -- temporarily patch treesitter install logic
            local cc = 'clang++ -std=c++11'
            function shell.select_executable(executables)
                return vim.tbl_filter(function(c) ---@param c string
                    return c ~= vim.NIL and (vim.fn.executable(c) == 1 or c == cc)
                end, executables)[1]
            end

            install.compilers = { cc }

            -- install norg parsers
            install.commands.TSInstallSync['run!'] 'norg' -- or vim.cmd [[ :TSInstallSync! norg ]]

            -- restore the defaults back
            shell.select_executable = select_executable
            install.compilers = compilers
        end,
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
