local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map('n', '<M-,>', ':BufferPrevious<CR>', opts)
map('n', '<M-.>', ':BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<M-<>', ':BufferMovePrevious<CR>', opts)
map('n', '<M->>', ' :BufferMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '<M-1>', ':BufferGoto 1<CR>', opts)
map('n', '<M-2>', ':BufferGoto 2<CR>', opts)
map('n', '<M-3>', ':BufferGoto 3<CR>', opts)
map('n', '<M-4>', ':BufferGoto 4<CR>', opts)
map('n', '<M-5>', ':BufferGoto 5<CR>', opts)
map('n', '<M-6>', ':BufferGoto 6<CR>', opts)
map('n', '<M-7>', ':BufferGoto 7<CR>', opts)
map('n', '<M-8>', ':BufferGoto 8<CR>', opts)
map('n', '<M-9>', ':BufferGoto 9<CR>', opts)
map('n', '<M-0>', ':BufferLast<CR>', opts)
-- Close buffer
map('n', '<M-c>', ':BufferClose<CR>', opts)
-- Wipeout buffer
--                 :BufferWipeout<CR>
-- Close commands
--                 :BufferCloseAllButCurrent<CR>
--                 :BufferCloseBufersLeft<CR>
--                 :BufferCloseBuffersRight<CR>
-- Magic buffer-picking mode
map('n', '<M-p>', ':BufferPick<CR>', opts)
-- Sort automatically by...
map('n', '<Space>bb', ':BufferOrderByBufferNumber<CR>', opts)
map('n', '<Space>bd', ':BufferOrderByDirectory<CR>', opts)
map('n', '<Space>bl', ':BufferOrderByLanguage<CR>', opts)

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be usedf
