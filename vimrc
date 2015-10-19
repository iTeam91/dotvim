set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/nerdtree'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'majutsushi/tagbar'
Plugin 'bling/vim-airline'
Plugin 'fisadev/FixedTaskList.vim'

call vundle#end()
filetype plugin indent on

syntax enable
set paste
set mousemodel=popup

set encoding=utf8
set termencoding=utf-8
set fileencodings=utf8,cp1251

set number
set cursorline
set ruler
set laststatus=2

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set list
set listchars=tab:▸·,eol:¬,precedes:«,extends:»

set scrolloff=3

set wrap
set linebreak
set breakat=" ^I!@*-+;:,./?"

set hlsearch
set incsearch
set ignorecase
set smartcase

set wildmenu
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,assets/*,.idea/*

set backspace=indent,eol,start

set history=1000
set undolevels=1000

set showcmd

set nobackup
set nowritebackup
set noswapfile

set hidden

set visualbell t_vb=

set t_Co=256
set background=dark
set guifont=Menlo_Regular:h18
colorscheme solarized

inoremap <C-c> <ESC>
let mapleader = ','
nmap <leader>l :set list!<CR>
nnoremap <silent> <Space> :nohl<Bar>:echo<CR>

map <F2> :NERDTreeToggle<CR>
map <F6> :bp<CR>
map <F7> :bn<CR>
map <C-q> :bd<CR>
map <F3> :TaskList<CR>
map <F4> :TagbarToggle<CR>

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$']

let g:tagbar_autofocus = 0

let g:airline_theme='base16'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

