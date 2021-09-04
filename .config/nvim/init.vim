"roby 04/09/2021
"folding binds: zo zc zr zm

" plugs " {{{
call plug#begin('~/.config/nvim/plugged')

"language server
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

"comment stuff ez
Plug 'tpope/vim-commentary'

"bracket stuff
Plug 'rstacruz/vim-closer'

"if,endif
Plug 'tpope/vim-endwise'

"colorize hex #ffffff
Plug 'chrisbra/Colorizer'

call plug#end()
"}}}

" auto completion " {{{
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

" theme " {{{
syntax enable
set termguicolors
runtime ./colors/hybrid.vim
colorscheme hybrid
"}}}

" custom binds " {{{
"select all
map <C-a> <esc>ggVG<CR>
"}}}

" stuff " {{{
set number		"line count
set mouse=a		"use mouse (cursed)
set wildoptions=pum 	"vim cmd completion (:)
set pumblend=25		"vim cmd completion transparency
set foldmethod=marker   "folding stuff
set foldlevel=0		"folding stuff

"not sure if this works when vim opens
let g:colorizer_auto_color = 1
"}}}

" setup lsp and auto completion " {{{
:lua << EOF
local nvim_lsp = require('lspconfig')
local on_attach = function(_, bufnr)
	require('completion').on_attach()
end
local servers = {'ccls'}
for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup {
		on_attach = on_attach,
	}
end
EOF
" }}}

