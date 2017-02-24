set encoding=utf-8

syntax on
" Set line number on
set nu
" Auto indent
set ai
" Enable cursor line
set cursorline
" Highlight search
set hlsearch
" Enable incrementally search
set incsearch
" Number of space chars inserted for indentation
set shiftwidth=4
" Convert tabs to spaces
set expandtab
" Insert 4 spaces for a tab
set tabstop=4

filetype indent on

" Color Settings
set bg=dark
hi LineNr cterm=bold ctermfg=DarkGrey ctermbg=NONE
hi CursorLineNr cterm=bold ctermfg=Green ctermbg=NONE
