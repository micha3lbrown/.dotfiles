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
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

call plug#end()
" -- End Plugins ------------------------------------------------------------

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLOR SCHEME
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme base16-summerfruit-dark
