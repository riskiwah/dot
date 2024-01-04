" Default Vim
colorscheme desert
set mouse=a
set encoding=utf-8
set fileencoding=utf-8
set ttyfast
set nocompatible
set backspace=indent,eol,start
set nocp digraph sc vb wmnu noeb noet nosol ai
"set ek
set com=b:#,:%,n:>
set ww=<,>,h,l
set bs=2
set list listchars=tab:»·,trail:·
set viminfo=%,'50,\"100,:100
" Still Default Vim
set hidden
set nowrap
set termguicolors
set hlsearch
set number
set linebreak
set ruler
set showmatch
set softtabstop=4
set shiftwidth=4
set tabstop=4
set textwidth=100
set smarttab
set smartindent
set expandtab
set binary
set noeol
syntax on
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
" Copy things
set modeline
set clipboard=unnamedplus
" Syntastic
set statusline+=%#warningmsg#
set statusline+=%*
