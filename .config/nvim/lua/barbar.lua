vim.cmd('set termguicolors')

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map('n', '<A-,>', ':BufferPrevious<CR>', opts)
map('n', '<A-.>', ':BufferNext<CR>', opts)

-- Goto buffer in position...
map('n', '<space>1', ':BufferGoto 1<CR>', opts)
map('n', '<space>2', ':BufferGoto 2<CR>', opts)
map('n', '<space>3', ':BufferGoto 3<CR>', opts)
map('n', '<space>4', ':BufferGoto 4<CR>', opts)
map('n', '<space>5', ':BufferGoto 5<CR>', opts)
-- no one uses more than 5 tabs, right?

-- Close tab
map('n', '<A-c>', ':BufferClose<CR>', opts)

-- Set barbar's options
vim.g.bufferline = {
    animation = true,
    auto_hide = false,
    tabpages = true,
    closable = true,
    clickable = true,
    icons = true
}
