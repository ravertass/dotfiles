colorscheme elflord

" Plugins

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" MiniZinc syntax highlighting
Plugin 'vale1410/vim-minizinc'
" vim-airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Plugins, end


" Set leader key
let mapleader = ","
" Set local leader key
let maplocalleader = "\\"


" Buffers

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" Buffers, end


" Turn on syntax highlighting
syntax on

" Show relative line numbers
set relativenumber
" Show absolute line number of current line
set number

" Show file stats
set ruler

" Encoding
set encoding=utf-8

" Whitespace
set textwidth=100
set colorcolumn=+1
set wrap
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround

" For Python
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs

" Move up/down editor lines
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk g

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Remove trailing whitespaces
nnoremap <leader>wr :%s/\s\+$//e<CR>

" Highlight trailing whitespaces
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+\%#\@<!$/

" Turn on trailing whitespace highlighting
nnoremap <Leader>wn :match ExtraWhitespace /\s\+\%#\@<!$/<CR>

" Turn off trailing whitespace highlighting
nnoremap <Leader>wf :match<CR>

" Searching
set hlsearch
set incsearch
set showmatch
map <leader><space> :let @/=''<cr>
