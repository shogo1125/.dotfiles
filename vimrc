"----------------------------------
" .vimrc (written by kazami)
" last update: 2014/12/24
"----------------------------------

set nu
colorscheme molokai
set autoindent
set nocompatible
set expandtab
set hidden
set shiftwidth=4
set incsearch
set showmatch
set smartcase
set smartindent
set smarttab
set tabstop=4
set whichwrap=b,s,h,l,<,>,[,]
set nowrapscan
set t_Co=256
set laststatus=2 
set wildmode=longest:full,full
set wildmenu
let g:molokai_original = 1
set hlsearch
set clipboard=unnamedplus
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set backspace=indent,eol,start
set list

au BufNewFile,BufRead *.html set nowrap tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.sh set nowrap tabstop=2 shiftwidth=2

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

call neobundle#end()

filetype plugin indent on
"-------------------------
" End Neobundle Settings.
"-------------------------
