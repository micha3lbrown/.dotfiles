filetype on
syntax on 
colorscheme Tomorrow-Night

let mapleader=" "

set number

map <leader>s :source ~/.vimrc<CR>

set hidden
set history=200

filetype indent on
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent
set hlsearch
set showmatch

nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>
nnoremap <Leader><Leader> :e#<CR>

autocmd BufWritePre * :%s/\s\+$//e
