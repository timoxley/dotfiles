Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ivalkeen/vim-ctrlp-tjump'

"let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_working_path_mode = 'w' " always use cwd
let g:ctrlp_dotfiles = 0 " Ignore all dot/hidden files
" custom_ignore in plugins_after

"let g:ctrlp_match_window_reversed = 0
"let g:ctrlp_match_window = 'bottom,order:ttb,min:10,max:10'
let g:ctrlp_mruf_case_sensitive = 0

" Kill buffers in Ctrl-P with Ctrl-@
" https://github.com/kien/ctrlp.vim/issues/280
let g:ctrlp_buffer_func = { 'enter': 'CtrlPEnter' }
func! CtrlPEnter()
  nnoremap <buffer> <silent> <C-@> :call <sid>CtrlPDeleteBuffer()<cr>
endfunc
func! s:CtrlPDeleteBuffer()
  let line = getline('.')
  let bufid = line =~ '\[\d\+\*No Name\]$' ?
    \ str2nr(matchstr(line, '\d\+')) :
    \ fnamemodify(line[2:], ':p')
  exec "bd" bufid
  exec "norm \<F5>"
endfunc

map <Leader><Space> :CtrlPMixed<CR>
map <Leader>T :CtrlPClearAllCaches<CR>:CtrlP<CR>
map <Leader>l :CtrlPBuffer<CR>
map <Leader>M :CtrlPBranch<CR>
map <Leader>d :CtrlPCurFile<CR>
map <silent> <C-]> :CtrlPtjump<CR>

" The Silver Searcher
"if executable('ag')
  "" Use ag over grep
  "set grepprg=ag\ --nogroup\ --nocolor

  "" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  "let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  "" ag is fast enough that CtrlP doesn't need to cache
  "let g:ctrlp_use_caching = 0
"endif
