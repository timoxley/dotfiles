function! ToggleColors()
  if &background == 'dark'
    colorscheme bclear
  else
    colorscheme paradox
  end
endfunction

IndentGuidesEnable
colorscheme paradox
let g:mimic_paradox_alt=1
let g:mimic_font_style=3
color paradox

map <Leader>C :call ToggleColors()<CR>

" increase contrast between cursor and search result
hi Search guifg=bg  guibg=#66b3b3 gui=NONE

" greenscale
" let g:vim_search_pulse_color_list=['#76dc43', '#beffbe']
