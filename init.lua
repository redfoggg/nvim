local fn = vim.fn
local execute = vim.api.nvim_command

-- map leader
vim.g.mapleader = ' '
vim.cmd [[packadd packer.nvim]]

-- Neovim general settings defaults
require('settings')

-- Auto install packer.nvim if not exists
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end
vim.cmd [[packadd packer.nvim]]
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua

-- Install plugins
require('plugins')

-- Key mappings
require('keymappings')

-- Config groups
require('config.colorscheme')
require('config.completion')
require('config.fugitive')

-- Treesitter configs
require('treesitter')

-- NvimTree config
require('plugins-config.nvim-tree')

-- barbar config
require('plugins-config.barbar')
