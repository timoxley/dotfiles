" vim-startify

autocmd User Startified setlocal cursorline

let g:startify_enable_special         = 0
let g:startify_files_number           = 8
let g:startify_relative_path          = 1
let g:startify_change_to_dir          = 1
let g:startify_update_oldfiles        = 1
let g:startify_session_autoload       = 1
let g:startify_session_persistence    = 1

autocmd VimEnter * " open NERDTree and Startify
            \   if !argc()
            \ |   Startify
            \ |   NERDTree
            \ |   wincmd w
            \ | endif

let g:startify_custom_header = [] " disable random quotes
let g:startify_custom_footer = [] " disable random quotes

 let g:startify_skiplist = [ 'COMMIT_EDITMSG' ]

 hi StartifyBracket ctermfg=240
 hi StartifyFile    ctermfg=147
 hi StartifyFooter  ctermfg=240
 hi StartifyHeader  ctermfg=114
 hi StartifyNumber  ctermfg=215
 hi StartifyPath    ctermfg=245
 hi StartifySlash   ctermfg=240
 hi StartifySpecial ctermfg=240

