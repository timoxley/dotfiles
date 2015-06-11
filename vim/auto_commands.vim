" Save on FocusLost
autocmd FocusLost * nested :silent! wall

" Markdown files
autocmd BufRead,BufNewFile {*.md,*.mkd,*.markdown} setlocal ft=markdown wrap iskeyword+='

" Treat dasherised words as whole words
autocmd Filetype css,scss,sass,js setlocal iskeyword+=-_

" Makefile
autocmd FileType make set noexpandtab

" Enable spell check by default for git commits & markdown
autocmd FileType gitcommit,markdown set spell

