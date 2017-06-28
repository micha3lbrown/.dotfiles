""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BUNDLES
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off

" -- Plugins: https://github.com/junegunn/vim-plug ---------------------------
call plug#begin('~/.vim/plugged')

Plug 'chriskempson/base16-vim'
Plug 'ervandew/supertab'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdtree'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'Xuyuanp/nerdtree-git-plugin'

call plug#end()
" -- End Plugins ------------------------------------------------------------

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CUSTOM AUTOCMDs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" Close vim if the only window is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLOR SCHEME
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme base16-summerfruit-dark
