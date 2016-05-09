Bundle 'ciaranm/detectindent'

let g:detectindent_preferred_expandtab = 1
let g:detectindent_preferred_indent = 2
let g:detectindent_preferred_when_mixed = 1
let g:detectindent_max_lines_to_analyse = 98

" Detect indent mode automatically (tab vs spaces)
autocmd BufReadPost * :DetectIndent
