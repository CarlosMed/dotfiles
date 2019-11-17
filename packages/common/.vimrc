" Automatic reload of .vimrc
autocmd! bufwritepost .vimrc source %

set relativenumber
set cursorline

" Sets tabbing
set autoindent
set textwidth =80
set expandtab

" set tabstop =4
set softtabstop =2
set shiftwidth =2

" Sets current path to vim path
set path+=**

" Sets wildmenu on file tab complete
set wildmenu

" Enables syntax highlighting and colorsceme
syntax on
colo tomorrow-night

:autocmd InsertEnter * set cul
:autocmd InsertLeave * set nocul

if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

" this makes vim use jj as an escape sequence
:imap jj <Esc>

