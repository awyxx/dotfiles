-- roby neovim config (lua version (basically still vimscript xD))
-- 19/04/2022

-- some credits: https://idie.ru/posts/vim-modern-cpp

vim.cmd('set encoding=UTF-8')

--
vim.cmd([[
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
]])

--
vim.o.completeopt="menuone,noinsert,noselect"

-- theme
vim.opt.background = "dark"
vim.cmd([[colorscheme gruvbox]])

-- line numbers
vim.api.nvim_command('set number')

-- switching between source and header file
vim.api.nvim_command('au BufEnter *.h  let b:fswitchdst = "c,cpp,cc,m"')
vim.api.nvim_command('au BufEnter *.cc let b:fswitchdst = "h,hpp"')
-- use this in case of having src/ and include/ separated
--vim.api.nvim_command('au BufEnter *.h let b:fswitchdst = \'c,cpp,m,cc\' | let b:fswitchlocs = \'reg:|include.*|src/**|\'')
vim.api.nvim_command('nnoremap <silent> <A-o> :FSHere<cr>')
-- " Extra hotkeys to open header/source in the split
vim.api.nvim_command('nnoremap <silent> <localleader>oh :FSSplitLeft<cr>')
vim.api.nvim_command('nnoremap <silent> <localleader>oj :FSSplitBelow<cr>')
vim.api.nvim_command('nnoremap <silent> <localleader>ok :FSSplitAbove<cr>')
vim.api.nvim_command('nnoremap <silent> <localleader>ol :FSSplitRight<cr>')

-- select all
vim.api.nvim_command('map <C-a> <esc>ggVG<CR>')

-- highlight trailing whitespaces (cuz we dont want 'em)
vim.api.nvim_command('highlight ExtraWhitespace ctermbg=red guibg=red')
vim.api.nvim_command('match ExtraWhitespace /\\s\\+$/')
vim.api.nvim_command('au BufWinEnter * match ExtraWhitespace /\\s\\+$/')
vim.api.nvim_command('au InsertEnter * match ExtraWhitespace /\\s\\+\\%#\\@<!$/')
vim.api.nvim_command('au InsertLeave * match ExtraWhitespace /\\s\\+$/')
vim.api.nvim_command('au BufWinLeave * call clearmatches()')
-- and remove them with leader+rs
vim.api.nvim_command('nnoremap <silent> <leader>rs :let _s=@/ <Bar> :%s/\\s\\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>')

-- copy pasting clipboard shortcuts
vim.api.nvim_set_keymap('', '<Leader>p', '"+p', { noremap = true })
vim.api.nvim_set_keymap('', '<Leader>P', '"+P', { noremap = true })
vim.api.nvim_set_keymap('', '<Leader>y', '"+y', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>Y', '"+y$', { noremap = true })

require('plugins')
require('lsp')
require('autocomplete')
require('lightline')
require('snippets')
require('nerdtree')
require('telescope')

-- other plugins

-- c/cpp better syntax highlight
-- https://github.com/bfrg/vim-cpp-modern

-- view and search symbols & tags (ctags required)
-- https://github.com/liuchengxu/vista.vim
vim.api.nvim_command('nnoremap <silent> <A-6> :Vista!!<CR>')
