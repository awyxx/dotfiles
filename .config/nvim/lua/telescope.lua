vim.cmd([[
"find file
nnoremap ff <cmd>Telescope find_files<cr>

"find word | grep smt
nnoremap fg <cmd>Telescope live_grep<cr>

"last buffers ig
nnoremap fb <cmd>Telescope buffers<cr>

"help
nnoremap fh <cmd>Telescope help_tags<cr>
]])
