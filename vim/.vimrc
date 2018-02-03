set nocompatible              " be iMproved, required
filetype off                 " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
" Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" Plugin 'airblade/vim-gitgutter'
" Plugin 'altercation/vim-colors-solarized'
" Plugin 'aykamko/tag'
" Plugin 'bling/vim-airline'
" Plugin 'wincent/Command-T'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
"  git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
"  The sparkup vim script is in a subdirectory of this repo called vim.
"  Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"   Install L9 and avoid a Naming conflict if you've already installed a
"   different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
" call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

syntax on               " Enable syntax highlighting
set number		" Always show line numbers
set showcmd		" Show (partial) command in status line.
set mouse=a		" Enable mouse usage (all modes)
set title

" Status bar always
set laststatus=2

" Highlight search
set hls

" 80 column marker
set colorcolumn=80

" Make < > shifts keep selection
vnoremap < <gv
vnoremap > >gv

set expandtab       " Use spaces as indentation
set softtabstop=4   " Use 4 spaces as indentation
set shiftwidth=4    " Make <<, >> and == use 4 spaces
set clipboard=unnamed
let g:netrw_liststyle=3

" Cool vim features for better automatic indenting :)
set smarttab
set autoindent
set smartindent
