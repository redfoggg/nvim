local utils = require('utils')
utils.opt('o', 'completeopt', 'menuone,noinsert,noselect')
vim.cmd [[set shortmess+=c]]
vim.g.completion_confirm_key = ""
vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}

-- use <tab> for trigger completion and navigate to the next complete item
vim.api.nvim_exec(
[[
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
]]
, false)
