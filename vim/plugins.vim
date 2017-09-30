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
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'jvirtanen/vim-octave'
Plugin 'mhinz/vim-startify'
Plugin 'airblade/vim-gitgutter'

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

let g:jsx_ext_required = 0 " JSX highlighting in JS files

" ale

let g:ale_linters = {
\   'javascript': ['eslint', 'flow'],
\}

autocmd FileType javascript let g:ale_linters = {
\  'javascript': findfile('.eslintrc', '.;') != '' ? [ 'eslint', 'flow' ] : [ 'standard', 'flow' ],
\}

let g:ale_sign_column_always = 1

" NERD

let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1

" vim-devicons

let g:airline_powerline_fonts = 1

" vim-gitgutter

set updatetime=250
let g:gitgutter_diff_args = '--no-color'
let g:gitgutter_override_sign_column_highlight = 0
