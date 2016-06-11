" Automatic reload of .vimrc
autocmd! bufwritepost .vimrc source %

syntax on
colo tomorrow-night

" ================ General Config ====================
set relativenumber
set number
set nocompatible
set ruler                       "Show line and column number
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
"set showmode                    "Show current mode down the bottom
"set gcr=a:blinkon0              "Disable cursor blink
"set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set encoding=utf-8              "Set default encoding to UTF-8
set shell=/bin/bash
set conceallevel=1

"removes all trailing whitespace upon :w
:autocmd BufWritePre * :%s/\s\+$//e

" Enable mouse use in all modes
set mouse=a
set ttyfast
set ttymouse=xterm2

" Default copy goes to system clipboard"
set clipboard=unnamed

" Change leader to <space> because the backslash is too far away
" That means all \x commands turn into <space>x
let mapleader=" "
let maplocalleader=" "

" ================ Search ===========================
set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

" ================ Indentation ======================
set autoindent
set smartindent
set smarttab
set textwidth =80
set expandtab
set tabstop =2
set softtabstop =2
set shiftwidth =2

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points
