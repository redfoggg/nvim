local utils = require'utils'

utils.map('n', '<C-n>', '<cmd>NvimTreeToggle<CR>')
utils.map('n', '<leader>r', '<cmd>NvimTreeRefresh<CR>')
utils.map('n', '<leader>n', '<cmd>NvimTreeFindFile<CR>')
