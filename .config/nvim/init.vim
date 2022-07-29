" Default Vim
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

" More better color pls :(
if has('termguicolors')
  set termguicolors
endif

" Alright it's Plugin times
call plug#begin()
  Plug 'sainnhe/gruvbox-material'
  Plug 'preservim/nerdtree'
call plug#end()

" For dark version.
set background=dark
" Available values: 'hard', 'medium'(default), 'soft'
let g:gruvbox_material_background = 'hard'
colorscheme gruvbox-material

" NerdTree
let NERDTreeShowHidden=1
autocmd VimEnter * NERDTree
autocmd VimEnter * NERDTree | wincmd p
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" NerdTree Close
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
" Auto reload
autocmd BufEnter NERD_tree_* | execute 'normal R'
au CursorHold * if exists("t:NerdTreeBufName") | call <SNR>15_refreshRoot() | endif

augroup DIRCHANGE
    au!
    autocmd DirChanged global :NERDTreeCWD
augroup END
