" Find files using Telescope command-line sugar.
nnoremap <C-p> <cmd>Telescope find_files hidden=true no_ignore=true<cr>
nnoremap <leader>fg <cmd>Telescope live_grep hidden=true no_ignore=true<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nnoremap <leader>gd <cmd>Telescope lsp_definitions<cr>

