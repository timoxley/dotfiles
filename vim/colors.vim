function! ToggleColors()
  if &background == 'dark'
    colorscheme bclear
  else
    colorscheme paradox
  end
endfunction

colorscheme paradox
let g:mimic_paradox_alt=1
let g:mimic_font_style=3
color paradox


map <Leader>C :call ToggleColors()<CR>

" increase contrast between cursor and search result
hi link Search Todo
hi link Search Todo

hi link SyntasticWarningSign SpellBad
hi link SyntasticWarning SpellBad


" greenscale
let g:vim_search_pulse_color_list=['#026866', '#30897a', '#5cad8e']

