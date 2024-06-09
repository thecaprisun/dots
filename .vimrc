vim9script

# ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
# ██║   ██║██║████╗ ████║██╔══██╗██╔════╝    config from gh/mtrkss, edited
# ██║   ██║██║██╔████╔██║██████╔╝██║         from github.com/thecaprisun
# ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║         add me on discord, _the.sun_
#  ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗    email me at sun@bleedingbox.dev
#   ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝

#  _ \ |     |  |  __| _ _|   \ |   __|
#  __/ |     |  | (_ |   |   .  | \__ \
# _|  ____| \__/ \___| ___| _|\_| ____/

plug#begin()
Plug 'girishji/vimcomplete'
Plug 'ap/vim-css-color'
Plug 'yggdroot/indentline'
plug#end()

# vimcomplete config

var dictproperties = {
    python: { sortedDict: false },
    text: { sortedDict: true }
}
var vcoptions = {
    dictionary: { enable: true, priority: 11, filetypes: ['python', 'text'], properties: dictproperties },
}
autocmd VimEnter * g:VimCompleteOptionsSet(vcoptions)
autocmd FileType text set dictionary+=/usr/share/dict/words
autocmd FileType python set dictionary=$HOME/.vim/data/pythondict

#   __|  __| __ __| __ __| _ _|   \ |   __|   __|
# \__ \  _|     |      |     |   .  |  (_ | \__ \
# ____/ ___|   _|     _|   ___| _|\_| \___| ____/

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

# some config from https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim
set autoread
au FocusGained,BufEnter * silent! clicktime
var mapleader = ","
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


#      ******       ******
#    **********   **********
#  ************* *************
# *****************************
# *****************************
# *****************************
#  ***************************
#    ***********************
#      *******************
#        ***************
#          ***********
#            *******
#              ***
