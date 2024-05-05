
return {
    "nvim-treesitter/nvim-treesitter",
    build = function()
        local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
        ts_update()
        require'nvim-treesitter.configs'.setup {
          ensure_installed = { "vimdoc", "javascript", "typescript", "c", "lua", "rust", "c_sharp", "clojure" },
          sync_install = false,
          auto_install = true,
          highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
          },
        }
    end,
}
