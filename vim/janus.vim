call janus#disable_plugin('syntastic')
:nnoremap <C-T> :CtrlPMRUFiles<CR>

autocmd BufNewFile,BufRead *.vp,*.fp,*.gp,*.vs,*.fs,*.gs,*.tcs,*.tes,*.cs,*.vert,*.frag,*.geom,*.tess,*.shd,*.gls,*.glsl set ft=glsl330
