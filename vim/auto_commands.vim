" Save on FocusLost
autocmd FocusLost * nested :silent! wall

" Markdown files
autocmd BufRead,BufNewFile {*.md,*.mkd,*.markdown} setlocal ft=markdown wrap iskeyword+='
autocmd BufRead,BufNewFile {*.md,*.mkd,*.markdown} setlocal cinkeys=

" JS Files
autocmd BufRead,BufNewFile {*.js,*.jsx} setlocal indentkeys-=*<Return>,<>>,<<>,/

" Treat dasherised words as whole words
autocmd Filetype css,js setlocal iskeyword+=-,_

" Makefile
autocmd FileType make setlocal noexpandtab

" Enable spell check by default for git commits & markdown
autocmd FileType gitcommit,markdown setlocal spell

" disable nerdtree refresh on focus
autocmd! AuNERDTreeCmd FocusGained *
