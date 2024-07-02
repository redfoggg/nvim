vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
vim.opt.list = true
vim.opt.listchars = { tab = "»·", trail = "·", eol = "↲", space = "·" }
vim.opt.cursorline = true

--vim.g.vimspector_enable_mappings = 'HUMAN'
-- Se quiser ter uma um limite visual em sua tela para não passar o código
-- deste limite
vim.opt.colorcolumn = "120"
