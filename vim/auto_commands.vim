" Save on FocusLost
autocmd FocusLost * nested :silent! wall

" Markdown files
autocmd BufRead,BufNewFile {*.md,*.mkd,*.markdown} setlocal ft=markdown wrap iskeyword+='
autocmd BufRead,BufNewFile {*.md,*.mkd,*.markdown} setlocal cinkeys=


" JS Files
autocmd BufRead,BufNewFile {*.js,*.jsx} setlocal indentkeys-=*<Return>,<>>,<<>,/

" Treat dasherised words as whole words
autocmd Filetype css,js,jsx setlocal iskeyword+=-,_

" Makefile
autocmd FileType make setlocal noexpandtab

" Enable spell check by default for git commits & markdown
autocmd FileType gitcommit,markdown setlocal spell

" disable nerdtree refresh on focus
autocmd! AuNERDTreeCmd FocusGained *

au BufRead,BufNewFile,BufEnter ~/Projects/streamr/* setlocal ts=4 sts=4 sw=4
au BufRead,BufNewFile,BufEnter ~/Projects/streamr/streamr-platform/**/{*.css,*.pcss} setlocal ts=2 sts=2 sw=2
au BufRead,BufNewFile,BufEnter ~/Projects/streamr/2/streamr-platform/**/{*.css,*.pcss} setlocal ts=2 sts=2 sw=2
au BufRead,BufNewFile,BufEnter ~/Projects/streamr/experiments/canvas/* setlocal ts=2 sts=2 sw=2
