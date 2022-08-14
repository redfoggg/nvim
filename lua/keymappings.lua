local utils = require('utils')

utils.map('n', '<C-l>', '<cmd>noh<CR>') -- Clear highlights
utils.map('n', '<C-n>', '<cmd>Explore<CR>')


-- Move lines in visual mode up and down
vim.api.nvim_exec(
[[
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
]]
, false)
