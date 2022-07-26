local fn = vim.fn
local execute = vim.api.nvim_command

-- map leader
vim.g.mapleader = ' '

-- Neovim general settings defaults
require('settings')

vim.cmd [[packadd packer.nvim]]
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua

-- Install plugins
require('plugins')

-- Key mappings
require('keymappings')

-- Config groups
require('config.colorscheme')
require('config.fugitive')

-- Treesitter configs
require('treesitter')

-- LspConfig
require('lsp')

vim.cmd([[
au! BufNewFile,BufRead *.axaml setf xml
]])
