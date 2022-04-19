vim.cmd([[
"find file
nnoremap ;ff <cmd>Telescope find_files<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>

"find word | grep smt
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap ;fg <cmd>Telescope live_grep<cr>

"last buffers ig
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap ;fb <cmd>Telescope buffers<cr>

"
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap ;fh <cmd>Telescope help_tags<cr>
]])
