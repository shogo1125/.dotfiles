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
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set autoindent
set smartindent
set shiftround

" filetype (general)
augroup MyFileTypeCmd
  autocmd!
  autocmd FileType sh,html,jade setlocal tw=0
  autocmd FileType py setlocal ts=4 sw=4 sts=2
augroup END

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

"skeleton
augroup MySkeletonCmd
  autocmd!
  autocmd BufNewFile *.sh 0r ~/.vim/skel/skeleton.sh
  autocmd BufNewFile *.py 0r ~/.vim/skel/skeleton.py
  autocmd BufNewFile *.html 0r ~/.vim/skel/skeleton.html
augroup END

" colorscheme
set t_Co=256
colorscheme molokai
let g:molokai_original = 1

filetype plugin indent on
syntax on


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
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'scrooloose/nerdtree'

call neobundle#end()

"-------- plugin settings ---------

" neocomplcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 0
let g:neocomplcache_enable_underbar_completion = 0
let g:neocomplcache_min_syntax_length = 3

" neosnippet
" Plugin key-mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"
" For snippet_complete marker.
if has('conceal')
  set conceallevel=2
  set concealcursor=i
endif

" indentLine
let g:indentLine_color_term = 59
let g:indentLine_color_gui = '#7E8E91'
let g:indentLine_char = '|'

" NERDTree
nmap <silent> <C-e> :NERDTreeToggle<CR>
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

filetype plugin indent on
syntax on

"-------------------------
" End Neobundle Settings.
"-------------------------

