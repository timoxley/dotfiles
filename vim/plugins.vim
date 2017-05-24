Plugin 'w0rp/ale'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'othree/html5.vim'
Plugin 'cespare/vim-toml'
Plugin 'wakatime/vim-wakatime'
Plugin 'alunny/pegjs-vim'
Plugin 'tikhomirov/vim-glsl'
Plugin 'mxw/vim-jsx'
Plugin 'bling/vim-airline'
Plugin 'terryma/vim-smooth-scroll'
Plugin 'jbnicolai/vim-AnsiEsc'

" vim-javascript

let g:javascript_plugin_flow = 1 " flowtype syntax
let g:javascript_plugin_jsdoc = 1 " jsdoc syntax


" Format .pcss as .css

autocmd BufNewFile,BufRead *.pcss set ft=css

" vim-pegjs

autocmd BufNewFile,BufRead *.peg set ft=pegjs

" vim-glsl

" Set additional filetype syntax highlighting
autocmd BufNewFile,BufRead *.vp,*.fp,*.gp,*.vs,*.fs,*.gs,*.tcs,*.tes,*.cs,*.vert,*.frag,*.geom,*.tess,*.shd,*.gls,*.glsl set ft=glsl

" vim-jsx

" JSX highlighting in JS files
let g:jsx_ext_required = 0

" vim-airline

set lazyredraw
set laststatus=1 " Always show the statusline

if !exists('g:airline_symbols')
let g:airline_symbols = {}

endif

let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tagbar#flags = 's'
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='dark'
let g:airline_section_c = '%F'

let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#excludes = []
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#branch#enabled = 1

let g:ale_linters = {
\   'javascript': ['eslint', 'flow'],
\}

autocmd FileType javascript let g:ale_linters = {
\  'javascript': findfile('.eslintrc', '.;') != '' ? [ 'eslint', 'flow' ] : [ 'standard', 'flow' ],
\}

let g:ale_sign_column_always = 1

let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1
