" Automatic Plugin Instalation for Vim-Plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

Plug 'wincent/terminus'
Plug 'scrooloose/nerdtree'

Plug 'morhetz/gruvbox'

call plug#end()

" Automatic reload of .vimrc
autocmd! bufwritepost .vimrc source %

set relativenumber
set cursorline

" Sets tabbing
set smarttab
set cindent
set autoindent
set textwidth=80
set expandtab

" set tabstop=2
set softtabstop=2
set shiftwidth=2

" Sets current path to vim path
set path+=**

" Sets wildmenu on file tab complete
set wildmenu

" Enables syntax highlighting and colorsceme
syntax on
colo gruvbox
set termguicolors

:autocmd InsertEnter * set cul
:autocmd InsertLeave * set nocul

if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

" this makes vim use jj as an escape sequence
:imap jj <Esc>

" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" NerdTree config
" Starts NerdTree automatically
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" NerdTree keymap remapped
nmap <C-b> :NERDTreeToggle<CR>
