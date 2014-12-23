"----------------------------------
" .vimrc (written by kazami)
" last update: 2014/12/24
"----------------------------------

scriptencoding utf-8

set nocompatible
set encoding=utf-8
set fileencoding=utf-8

" display
set number
set ruler
set cursorline
"set cursorcolumn
set laststatus=2
set cmdheight=2
set showmatch
set list
set listchars=tab:>.
set ambiwidth=double

" cursor
set backspace=indent,eol,start
set whichwrap=b,s
set scrolloff=4
set sidescrolloff=8
set sidescroll=1
set matchpairs+=<:>

" file
set confirm
set hidden
set autoread
set nobackup
set noswapfile

" search/replace
set hlsearch
set incsearch
set ignorecase
set smartcase
set nowrapscan


" tab/indent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set autoindent
set smartindent
set shiftround
" change indent width by file type
autocmd BufNewFile,BufRead *.html set nowrap tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.sh set nowrap tabstop=2 shiftwidth=2

" command-line
set wildmenu
set wildmode=longest,full
set history=1000

" clipboard
set clipboard=unnamedpluS

" mouse
set mouse=

" statusline
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

" command (general)
command! EditVimrc edit $MYVIMRC
command! ReloadVimrc source $MYVIMRC

" colorscheme
set t_Co=256
colorscheme molokai_custom
let g:molokai_original = 1


"---------------------------
" Start Neobundle Settings.
"---------------------------
if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
  finish
endif
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

"----- plugins -----
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'tomasr/molokai'

call neobundle#end()

filetype plugin indent on
"-------------------------
" End Neobundle Settings.
"-------------------------
