local utils = require('utils')
local cmd = vim.cmd


-- Configs for colorschemes must be set before colorscheme
vim.g.onedark_hide_endofbuffer = 1


vim.g.gruvbox_flat_style = "hard"

cmd 'colorscheme gruvbox-flat'
