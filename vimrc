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
