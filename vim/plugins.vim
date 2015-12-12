Plugin 'mxw/vim-jsx'

Plugin 'cespare/vim-toml'

Plugin 'alunny/pegjs-vim'
autocmd BufNewFile,BufRead *.peg set ft=pegjs

Plugin 'tikhomirov/vim-glsl'
" Set additional filetype syntax highlighting
autocmd BufNewFile,BufRead *.vp,*.fp,*.gp,*.vs,*.fs,*.gs,*.tcs,*.tes,*.cs,*.vert,*.frag,*.geom,*.tess,*.shd,*.gls,*.glsl set ft=glsl

Plugin 'othree/yajs.vim'

" JSX highlighting in JS files
let g:jsx_ext_required = 0

Plugin 'hail2u/vim-css3-syntax'
Plugin 'othree/html5.vim'

Plugin 'bling/vim-airline'
set lazyredraw
set laststatus=2 " Always show the statusline

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


Plugin 'rizzatti/funcoo.vim'
Plugin 'rizzatti/dash.vim'
Plugin '29decibel/vim-stringify'
Plugin 'nathanaelkane/vim-indent-guides'

Plugin 'wakatime/vim-wakatime'
