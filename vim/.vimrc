" don't bother with vi compatibility
set nocompatible

" enable syntax highlighting
syntax enable

call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'dracula/vim'
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'goldfeld/vim-seek'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'vimwiki/vimwiki'
call plug#end()

" ensure ftdetect et al work by including this after the Vundle stuff
filetype plugin indent on

" set autoindent
set autoread                " reload files when changed on disk
set backspace=2             " Fix broken backspace in some setups
set backupcopy=yes          " see :help crontab
set clipboard=unnamed       " yank and paste with the system clipboard
set directory-=.            " don't store swapfiles in the current directory
set encoding=utf-8
set expandtab               " expand tabs to spaces
set ignorecase              " case-insensitive search
set incsearch               " search as you type
set laststatus=2            " always show statusline
set number                  " show line numbers
set ruler                   " show where you are
set scrolloff=3             " show context above/below cursorline
set shiftwidth=4            " normal mode indentation commands use 4 spaces
set showcmd
set smartcase               " case-sensitive search if any caps
set softtabstop=2           " insert mode tab and backspace use 2 spaces

" Enable basic mouse behavior such as resizing buffers.
set mouse=a

" keyboard shortcuts
let mapleader = ','
nmap <leader>g :GitGutterToggle<CR>
nmap <leader>p :set paste!<CR>
map <silent> <leader>R :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>s <C-w>s
nnoremap <leader>vsa :vert sba<cr>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


" in case you forgot to sudo
cmap w!! %!sudo tee > /dev/null %

" plugin settings
let g:gitgutter_enabled = 0
let g:rustfmt_autosave = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 1
" let g:airline_theme = 'dracula'

" customize gui vim
if has("gui_running")
  set guifont=SourceCodePro-Regular:h14
endif

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

" colors
colorscheme dracula
set background=dark
" don't use ugly terminal background color
hi NonText ctermbg=NONE 

" Fixing stupid shift key mistakes
cab W! w!
cab Q! q!
cab Wq wq
cab wQ wq
cab WQ wq
cab W w
cab Q q
