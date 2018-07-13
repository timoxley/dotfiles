Plugin 'w0rp/ale'
Plugin 'ekalinin/Dockerfile.vim'
"Plugin 'sheerun/vim-polyglot'
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'othree/html5.vim'
"Plugin 'cespare/vim-toml'
Plugin 'wakatime/vim-wakatime'
Plugin 'alunny/pegjs-vim'
"Plugin 'tikhomirov/vim-glsl'
"Plugin 'mxw/vim-jsx'

Plugin 'bling/vim-airline'
Plugin 'terryma/vim-smooth-scroll'
Plugin 'jbnicolai/vim-AnsiEsc'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'jvirtanen/vim-octave'
Plugin 'mhinz/vim-startify'
Plugin 'airblade/vim-gitgutter'
Plugin 'alexlafroscia/postcss-syntax.vim'

"Plugin 'ryanoasis/vim-devicons'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'

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

"let g:jsx_ext_required = 0 " JSX highlighting in JS files

" ale

let g:ale_linters = {
\   'javascript': ['eslint', 'flow'],
\}

autocmd FileType javascript let g:ale_linters = {
\  'javascript': glob('.eslintrc*', '.;') != '' ? [ 'eslint', 'flow' ] : [ 'standard', 'flow' ],
\}

call ale#Set('javascript_standard_options', '--parser=babel-eslint')
let g:ale_sign_column_always = 1

" NERD

set lazyredraw " improve NERDTree render speed
" let g:NERDSpaceDelims = 1
" let g:NERDTrimTrailingWhitespace = 1
"
" let g:webdevicons_gui_glyph_fix = 1
 "let g:webdevicons_conceal_nerdtree_brackets = 1
"let g:WebDevIconsUnicodeDecorateFolderNodes = 1
"let g:WebDevIconsNerdTreeGitPluginForceVAlign = 0
"let g:WebDevIconsUnicodeGlyphDoubleWidth = 0
"let g:WebDevIconsOS = 'Darwin'

" vim-devicons

let g:airline_powerline_fonts = 1

" vim-gitgutter

set updatetime=2000
let g:gitgutter_diff_args = '--no-color'
let g:gitgutter_override_sign_column_highlight = 0

" Disable syntax highlighting after 256 columns
set synmaxcol=256
syntax sync minlines=256
