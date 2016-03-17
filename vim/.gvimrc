colorscheme kernel

:language en_US.UTF-8

set guioptions=   " default=egmrL
set guifont=Monaco:h12
set guitablabel=%N:%M%t
set visualbell
set ambiwidth=double
set linespace=2
"set cursorline

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
