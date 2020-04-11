" Ignore error if not installed pathogen.vim for runtime path manipulation
silent! execute pathogen#infect()

"
" NERD Tree
"
" NERDTree plugin: https://github.com/scrooloose/nerdtree
" Bind <F5> to quick open and close tree hierarchy
map <silent><F5> :NERDTreeToggle<CR>
" Default open NERDTree
silent! autocmd vimenter * NERDTree
" Enable mosue click in NORMAL/VISUAL modes
set mouse=nv
let NERDTreeMouseMode = 3
" Exit if NERDTree is the last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"
" Tag list
"
" TagList plugin: https://github.com/vim-scripts/taglist.vim
" Bind <F6> to quick open and close taglist window
map <silent><F6> :TlistToggle<CR>
" Show current file Tlist
let Tlist_Show_One_File = 1
" Exit if Tlist is the last window
let Tlist_Exit_OnlyWindow = 1
" Open Tlist with oth right-hand side
let Tlist_Use_Right_Window = 1


"
" Cscope
"
if has("cscope")
    " Use both cscope and ctag for 'ctrl+]', 'ta', and 'vim -t'
    set cscopetag
    set csto=0
    if filereadable("cscope.out")
        cs add cscope.out
    elseif $CSCOPE_DB != ""
        cs add $CSOPE_DB
    endif

    " Show msg when any other cscope db added
    set cscopeverbose

    ""nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    ""nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    ""nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    ""nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    ""nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    ""nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    ""nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    ""nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

endif

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
" Make a line no wrap if it is longer than shown
set nowrap
" Enable wildmenu in command mode
set wildmode=longest,list
" Indent and backward indent in normal mode
nmap <tab> V>
nmap <S-Tab> V<

if has("autocmd")
augroup cprog
    au!
    " Make c program comment auto completion
    autocmd FileType h,c,cpp set formatoptions=croql cindent comments=sr:/*,mb:*,el:*/,://

    " [makefiles]: Don't expand tabs to spaces, since actual tab characters are
    " needed, and have indentation at 8 chars to be sure that all indents are tabs
    " (despite the mappings later):
    autocmd FileType make set noexpandtab shiftwidth=4 softtabstop=0
    autocmd FileType *     set formatoptions=tcql nocindent comments&
augroup END

" Remove all trailing whitespace
autocmd BufWritePre * %s/\s\+$//e
endif

" Fix control character if xterm
if &term == "xterm"
    set t_kb=^?
    set t_kD=^H
    fixdel
endif

" Move a line up/down
nnoremap <S-DOWN> :m .+1<CR>==
nnoremap <S-UP> :m .-2<CR>==
inoremap <S-DOWN> <Esc>:m .+1<CR>==gi
inoremap <S-UP> <Esc>:m .-2<CR>==gi
vnoremap <S-DOWN> :m '>.+1<CR>gv==gv
vnoremap <S-Up> :m '<.-21<CR>gv==gv

"
" Color Settings
"
" Molokai scheme: https://github.com/tomasr/molokai
syntax on
" Enable molokai color scheme
silent! colorscheme molokai
" Override color of line number and current line number
set t_Co=256
set bg=dark
hi LineNr cterm=bold ctermfg=DarkGrey ctermbg=NONE
hi CursorLineNr cterm=bold ctermfg=Green ctermbg=NONE
hi Include cterm=bold ctermfg=Red ctermbg=NONE
hi PreCondi cterm=bold ctermfg=Red ctermbg=NONE
hi Macro cterm=Italic ctermfg=White ctermbg=NONE
hi Error cterm=Italic ctermfg=White ctermbg=NONE
hi Visual cterm=bold ctermfg=black ctermbg=white
""hi Define cterm=Italic ctermfg=White ctermbg=NONE

" Override color of status line
" Refer to https://magiclen.org/vimrc/
set statusline=%#filepath#[%{expand('%:p')}]%#filetype#[%{strlen(&fenc)?&fenc:&enc}]%#filesize#%{FileSize()}%{IsBinary()}%=%#position#%c,%l/%L\ [%3p%%]
hi position cterm=none ctermfg=228 ctermbg=238
function IsBinary()
    if (&binary == 0)
        return ""
    else
        return "[Binary]"
    endif
endfunction

function FileSize()
    let bytes = getfsize(expand("%:p"))
    if bytes <= 0
        return "[Empty]"
    endif
    if bytes < 1024
        return "[" . bytes . "B]"
    elseif bytes < 1048576
        return "[" . (bytes / 1024) . "KB]"
    else
        return "[" . (bytes / 1048576) . "MB]"
    endif
endfunction
