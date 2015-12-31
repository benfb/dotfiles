" don't bother with vi compatibility
set nocompatible

" enable syntax highlighting
syntax enable

call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'chriskempson/base16-vim'
Plug 'reedes/vim-colors-pencil'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'bling/vim-airline'
Plug 'goldfeld/vim-seek'
Plug 'fatih/vim-go', { 'for': 'golang' }
call plug#end()

" ensure ftdetect et al work by including this after the Vundle stuff
filetype plugin indent on

" set autoindent
set autoread                                                 " reload files when changed on disk
set backspace=2                                              " Fix broken backspace in some setups
set backupcopy=yes                                           " see :help crontab
set clipboard=unnamed                                        " yank and paste with the system clipboard
set directory-=.                                             " don't store swapfiles in the current directory
set encoding=utf-8
set expandtab                                                " expand tabs to spaces
set ignorecase                                               " case-insensitive search
set incsearch                                                " search as you type
set laststatus=2                                             " always show statusline
set number                                                   " show line numbers
set ruler                                                    " show where you are
set scrolloff=3                                              " show context above/below cursorline
set shiftwidth=4                                             " normal mode indentation commands use 4 spaces
set showcmd
set smartcase                                                " case-sensitive search if any caps
set softtabstop=2                                            " insert mode tab and backspace use 2 spaces
set tabstop=8                                                " actual tabs occupy 8 characters

" Enable basic mouse behavior such as resizing buffers.
set mouse=a

" keyboard shortcuts
let mapleader = ','
nmap <leader>g :GitGutterToggle<CR>
nmap <leader>p :set paste!<CR>
map <silent> <leader>R :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" in case you forgot to sudo
cmap w!! %!sudo tee > /dev/null %

" plugin settings
let g:gitgutter_enabled = 0
let g:go_fmt_command = "goimports"

" md is markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown

autocmd! bufwritepost .vimrc source ~/.vimrc " reload vimrc after write
set whichwrap+=<,>,h,l,[,] " Wrap arrow keys between lines
set nocursorline " don't highlight current line

" keyboard shortcuts
inoremap jj <ESC>

" highlight search
set hlsearch
nmap <leader>hl :let @/ = ""<CR>

let base16colorspace=256
colorscheme base16-atelierheath
set background=dark

" Fixing stupid shift key mistakes
cab W! w!
cab Q! q!
cab Wq wq
cab Wa wa
cab wQ wq
cab WQ wq
cab W w
cab Q q
