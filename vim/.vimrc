set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#begin()
Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'
Plugin 'vcscommand.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'rking/ag.vim'
Plugin 'tdavis/proj-vim'
Plugin 'vim-php/tagbar-phpctags.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/syntastic'
Plugin 'pangloss/vim-javascript'
call vundle#end()

filetype plugin indent on

syntax enable
colorscheme darkspectrum

set autoindent
set autoread
set clipboard=unnamed
set encoding=utf-8
set expandtab
set fileencoding=utf-8
set fileencodings=utf-8,chinese
set ignorecase smartcase
set laststatus=2
set list
set listchars=tab:▸\ ,trail:▫
set nobackup
set nomodeline
set nowrap
set number
set scrolloff=10
set shiftwidth=4
set showcmd
set showmatch
set smartindent
set startofline
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l(%L),%c%V%8P
set tabstop=4
set wildmenu
set wildmode=longest,list,full

set foldmethod=indent
set foldnestmax=2
set foldlevel=1
set foldminlines=3

autocmd FileType javascript call SetJsFolding()

if exists('$TMUX') " Support resizing in tmux
    set ttymouse=xterm2
endif

let autosave=10

" keyboard shortcuts
let mapleader = ','
"nmap <leader>a :Ack
nmap <leader>a :Ag
nmap <leader>e :Explore<CR>
"nmap <leader>t :TlistToggle<CR>
nmap <leader>t :TagbarToggle<CR>
map <leader><space> :StripWhitespace<CR>
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" move cursor in insert mode
imap <C-h> <left>
imap <C-l> <right>
imap <C-j> <down>
imap <C-k> <up>
imap <C-a> <esc>I
imap <C-e> <esc>A

:nmap <C-n> :tabnext<cr>
:nmap <C-p> :tabprevious<cr>
:nmap <C-l> :only<cr>
:nmap <C-Tab> :CtrlPBuffer<cr>
nnoremap <silent><f7> :!php -ql %<cr>
nnoremap <silent><f6> :!php -q %<cr>

" CtrlP plugin
let g:ctrlp_map = '<c-g>'
let g:ctrlp_working_path_mode=0
let g:ctrlp_by_filename = 0
let g:ctrlp_regexp = 1
let g:ctrlp_max_depth = 10
let g:ctrlp_max_files = 2000
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*        " Linux/MacOSX

" youcompleteme plugin
let g:ycm_key_invoke_completion = ''
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_min_num_identifier_candidate_chars = 2
set completeopt-=preview

" Proj
let g:ProjFileBrowser='off'
:nmap <D-P> :ProjOpen<cr>

" tagbar plugin
let g:tagbar_ctags_bin='/Users/yeaha/bin/ctags'
let g:tagbar_autofocus = 1
let g:tagbar_sort = 1
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : '/Users/yeaha/go/bin/gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" phpctags
let g:tagbar_phpctags_bin='/Users/yeaha/bin/phpctags'

" VCSCommand plugin
"let g:VCSCommandDisableAll=1
"let g:VCSCommandSplit="horizontal"
let g:VCSCommandDeleteOnHide=1
let g:VCSCommandDisableExtensionMappings=1
let g:VCSCommandDisableMappings=1
let g:VCSCommandEdit="split"
let g:VCSCommandEnableBufferSetup=0
let g:VCSCommandSVNExec="/usr/local/bin/svn"
"let g:VCSCommandSplit="vertical"

" netrw plugin
nnoremap <silent><f4> :Explore<cr>
let g:netrw_liststyle=1
let g:netrw_timefmt='%Y-%m-%d %H:%M:%S'
let g:netrw_preview=1

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 5

" php syntax
let php_sql_query = 1
let php_html_in_string = 1
let php_parent_error_close = 1
let php_parent_error_open = 1

" jshint
let jshint2_read = 0
let jshint2_save = 0

" golang
"let g:go_fmt_command = "goimports"
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_nr = 0

function SetJsFolding()
    setlocal foldmethod=indent
    setlocal foldnestmax=4
endfunction
