" Ignore error if not installed pathogen.vim for runtime path manipulation
silent! execute pathogen#infect()

"
" NERD Tree
"
" NERDTree plugin: https://github.com/scrooloose/nerdtree
" Bind <F5> to quick open and close tree hierarchy
map <F5> :NERDTreeToggle<CR>
silent! autocmd vimenter * NERDTree

"
" Tag list
"
" TagList plugin: https://github.com/vim-scripts/taglist.vim
" Bind <F6> to quick open and close taglist window
map <F6> :TlistToggle<CR>
" Show current file Tlist
let Tlist_Show_One_File = 1
" Exit if Tlist is the last window
let Tlist_Exit_OnlyWindow = 1
" Open Tlist with oth right-hand side
let Tlist_Use_Right_Window = 1



" Enable filetype detection
filetype on
filetype indent on
set encoding=utf-8

" Set line number on
set nu
" Auto indent
set autoindent
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

"set smarttab

" [makefiles]: Don't expand tabs to spaces, since actual tab characters are
" needed, and have indentation at 8 chars to be sure that all indents are tabs
" (despite the mappings later):
autocmd FileType make set noexpandtab shiftwidth=4 softtabstop=0

" 
" Color Settings
"
" Molokai scheme: https://github.com/tomasr/molokai
syntax on
" Enable molokai color scheme
silent! colorscheme molokai
" Override color of line number and current line number
set bg=dark
hi LineNr cterm=bold ctermfg=DarkGrey ctermbg=NONE
hi CursorLineNr cterm=bold ctermfg=Green ctermbg=NONE
hi Include cterm=bold ctermfg=Red ctermbg=NONE
hi PreCondi cterm=bold ctermfg=Red ctermbg=NONE
hi Macro cterm=Italic ctermfg=White ctermbg=NONE
""hi Define cterm=Italic ctermfg=White ctermbg=NONE

