" ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
" ██║   ██║██║████╗ ████║██╔══██╗██╔════╝    config from github.com/mtrkss
" ██║   ██║██║██╔████╔██║██████╔╝██║         from github.com/thecaprisun
" ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║         add me on discord, _the.sun_
"  ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗    email me at sun@bleedingbox.dev
"   ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝





set number
set ruler
set backspace=indent,eol,start
syntax on 
set ignorecase
set confirm
set cmdheight=1
set mouse=a
set hid
set clipboard=unnamedplus

" some config from https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim
set autoread
au FocusGained,BufEnter * silent! clicktime
let mapleader = ","
nmap <leader>w :w!<cr>
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!
set hlsearch
set magic
set showmatch
set incsearch
set mat=2
set noerrorbells
set novisualbell
set t_vb=
set tm=500
if $TERM == 'rxvt-unicode-256color'
    set t_Co=256
endif
set background=dark
set encoding=utf8
map <space> /
map <C-space> ?
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"      ******       ******
"    **********   **********
"  ************* *************
" *****************************
" *****************************
" *****************************
"  ***************************
"    ***********************
"      *******************
"        ***************
"          ***********
"            *******
"              ***
