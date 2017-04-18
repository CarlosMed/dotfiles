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

