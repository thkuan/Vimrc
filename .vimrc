" Enable filetype detection
filetype on
filetype indent on
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
" Convert tabs to spaces
set expandtab
" Insert 4 spaces for a tab
set tabstop=4
" Number of space chars inserted for indentation
set shiftwidth=4

set smarttab
set autoindent

" [makefiles]: Don't expand tabs to spaces, since actual tab characters are
" needed, and have indentation at 8 chars to be sure that all indents are tabs
" (despite the mappings later):
autocmd FileType make set noexpandtab shiftwidth=4 softtabstop=0

" Color Settings
set bg=dark
hi LineNr cterm=bold ctermfg=DarkGrey ctermbg=NONE
hi CursorLineNr cterm=bold ctermfg=Green ctermbg=NONE
