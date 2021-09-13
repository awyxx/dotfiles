"roby 04/09/2021
"folding binds: zo zc zr zm

" plugs " {{{
call plug#begin('~/.config/nvim/plugged')

"language server and completion
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

"nerdtree
Plug 'preservim/nerdtree'

"comment stuff ez
Plug 'tpope/vim-commentary'

"bracket stuff
Plug 'rstacruz/vim-closer'

"if,endif
Plug 'tpope/vim-endwise'

"colorize hex #ffffff
Plug 'chrisbra/Colorizer'

"status bar
Plug 'itchyny/lightline.vim'

" syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

"bar buffers
Plug 'kyazdani42/nvim-web-devicons'
Plug 'akinsho/bufferline.nvim'

call plug#end()
"}}}

" theme " {{{
syntax enable
set termguicolors
runtime ./colors/hybrid.vim
colorscheme hybrid

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    custom_captures = {
      -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
      ["foo.bar"] = "Identifier",
    },
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF
"}}}

" some custom binds " {{{
"select all
map <C-a> <esc>ggVG<CR>

nmap <C-t> :NERDTreeToggle<CR>
nmap <C-f> :NERDTreeFind<CR>
map <C-d> :NERDTreeToggle %<CR>

"see full hint message
nnoremap <silent> g? <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
"}}}

" stuff " {{{
filetype plugin indent on
set number		"line count
set mouse=a		"use mouse (cursed)
set wildoptions=pum 	"vim cmd completion (:)
set pumblend=15		"vim cmd completion transparency
set foldmethod=marker   "folding stuff
set foldlevel=0		"folding stuff
set clipboard=unnamedplus "copypasting
set noshowmode		"disable -- insert --
set textwidth=75	"max chars line

"not sure if this works when vim opens
let g:colorizer_auto_color = 1

"}}}

" lsp and auto completion " {{{ 
lua << EOF
local lsp = require('lspconfig')

-- c cpp ...
lsp.ccls.setup { on_attach = require('completion').on_attach }

-- rust
lsp.rust_analyzer.setup { on_attach = require('completion').on_attach }

-- ts
lsp.tsserver.setup { on_attach = require('completion').on_attach  }

EOF
"}}}

" auto completion configuration" {{{
set completeopt=menuone,noinsert,noselect "better completion experience
set shortmess+=c  			  "avoid too many messages on completion

"i never use this but ok, confirm completion
let g:completion_confirm_key = "|<c-y>"

":help g:completion_matching_strategy_list
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy'] 

"navigate through auto completion menu,  <tab> goes down, <shift-tab> goes up
inoremap <expr> <tab>   pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

"todo: install some snippets
"}}}

" bufferline " {{{
lua << EOF
require("bufferline").setup{}
EOF
nmap <c-n> :BufferLineCycleNext<CR>
nmap <c-right> :BufferLineCycleNext<CR>
nmap <c-s-n> :BufferLineCyclePrev<CR>
nmap <c-left> :BufferLineCyclePrev<CR>
nmap <c-q> :bd!<CR>
" }}}

