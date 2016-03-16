"colorscheme darkspectrum
"colorscheme desert
"colorscheme nicotine
"colorscheme professional
"colorscheme lucius
"colorscheme hybrid

"set background=dark
"colorscheme solarized

"let g:molokai_original = 1
"colorscheme molokai

colorscheme reloaded
syntax off

:language en_US.UTF-8

set guioptions=   " default=egmrL
set guifont=Monaco:h12
set guitablabel=%N:%M%t
set visualbell
set ambiwidth=double

" vim-airline
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'

if has("gui_macvim")
    " set transparency=10

    " map cmd+1~9 to switch tab 1~9
    for i in range(1, 9)
        exec "nnoremap <D-".i."> ".i."gt"
    endfor
endif
