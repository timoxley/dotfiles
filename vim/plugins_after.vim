if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif

let g:ctrlp_custom_ignore = {
 \ 'dir': '\.git$\|\.hg$\|\.svn$\|backups$\|logs$\|tmp$\|_site\|node_modules\|dist\|build$\|coverage$\|lcov-report$',
 \ 'file': '\.DS_Store$',
 \ 'link': '',
 \ }
