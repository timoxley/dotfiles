Plugin 'dense-analysis/ale'
Plugin 'ekalinin/Dockerfile.vim'
"Plugin 'sheerun/vim-polyglot'
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'othree/html5.vim'
"Plugin 'cespare/vim-toml'
Plugin 'wakatime/vim-wakatime'
Plugin 'alunny/pegjs-vim'
Plugin 'MaxMEllon/vim-jsx-pretty'
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
Plugin 'mg979/vim-visual-multi'

"Plugin 'xolox/vim-misc'
"Plugin 'xolox/vim-session'


Plugin 'styled-components/vim-styled-components'
Plugin 'ryanoasis/vim-devicons'
"Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'

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
\   'javascriptreact': ['eslint', 'flow'],
\}

autocmd FileType javascript let g:ale_linters = {
\  'javascript': glob('.eslintrc*', '.;') != '' ? [ 'eslint', 'flow' ] : [ 'standard', 'flow' ],
\  'javascriptreact': glob('.eslintrc*', '.;') != '' ? [ 'eslint', 'flow' ] : [ 'standard', 'flow' ],
\}

autocmd FileType javascript let g:ale_fixers = {
\  'javascript': glob('.eslintrc*', '.;') != '' ? [ 'eslint' ] : [ 'standard' ],
\  'javascriptreact': glob('.eslintrc*', '.;') != '' ? [ 'eslint' ] : [ 'standard' ],
\}

call ale#Set('javascript_standard_options', '--parser=babel-eslint')
let g:ale_javascript_eslint_executable = 'eslint_d'
let g:ale_sign_column_always = 1
"let g:ale_change_sign_column_color = 1

" NERD

set lazyredraw " improve NERDTree render speed
 " let g:NERDSpaceDelims = 1
 " let g:NERDTrimTrailingWhitespace = 1
"
 " let g:webdevicons_gui_glyph_fix = 1
 "let g:webdevicons_conceal_nerdtree_brackets = 1
" let g:WebDevIconsUnicodeDecorateFolderNodes = 1
" let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
" let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
" let g:WebDevIconsOS = 'Darwin'

" vim-devicons

let g:airline_powerline_fonts = 1

" vim-gitgutter

set updatetime=2000
let g:gitgutter_diff_args = '--no-color'
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_sign_allow_clobber = 1
" prevent clobbering ale signs
let g:gitgutter_sign_priority = 0

" Disable syntax highlighting after 256 columns
set synmaxcol=256
syntax sync minlines=256

" mg979/vim-visual-multi
let g:VM_maps = {}
let g:VM_maps["Add Cursor Down"]             = '<leader><Down>'
let g:VM_maps["Add Cursor Up"]               = '<leader><Up>'


noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 10, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 10, 4)<CR>

