function! ToggleErrors()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
        " Nothing was closed, open syntastic error location panel
        Errors
    endif
endfunction

function! StrTrim(txt)
  return substitute(a:txt, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
endfunction

nnoremap <silent> <Leader>; :<C-@>call ToggleErrors()<CR>

let g:syntastic_javascript_checkers = ['eslint']

"autocmd FileType javascript let b:syntastic_checkers = findfile('node_modules/.bin/standard', '.;') != '' ? [ 'standard' ] : [ 'eslint' ]

"let g:syntastic_javascript_flow_exe = 'flow'
let b:syntastic_javascript_eslint_exec = StrTrim(system('npm-which eslint'))

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "passive_filetypes": ["css"] }

