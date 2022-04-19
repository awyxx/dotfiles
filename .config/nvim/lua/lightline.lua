-- itchyny/lightline.vim
-- spywhere/lightline-lsp

vim.cmd([[
function! LightlineCurrentFunctionVista() abort
  let l:method = get(b:, 'vista_nearest_method_or_function', '')
  if l:method != ''
    let l:method = '[' . l:method . ']'
  endif
  return l:method
endfunction
]])

vim.api.nvim_command('au VimEnter * call vista#RunForNearestMethodOrFunction()')

vim.g['lightline'] = {
	colorscheme = 'gruvbox',
	active = {
		left = { { 'mode', 'paste' }, { 'readonly', 'filename', 'modified' }, { 'current_function' } },
		right = {
			{ 'linter_errors', 'linter_warnings', 'lineinfo' },
			{ 'fileformat', 'fileencoding', 'filetype' }
		}
	},
	component_expand = {
		linter_errors = 'lightline#lsp#errors',
		linter_warnings = 'lightline#lsp#warnings'
		-- linter_hints, linter_infos, linter_ok
	},
	component_type = {
		linter_errors = 'error',
		linter_warnings = 'warning'
	},
	component_function = {
		current_function = 'LightlineCurrentFunctionVista',
	}
}
