" install vim-plug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'arcticicestudio/nord-vim'
Plug 'dracula/vim'
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'goldfeld/vim-seek'
Plug 'hashivim/vim-terraform'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'
Plug 'vimwiki/vimwiki'
Plug 'w0rp/ale'
Plug 'zchee/deoplete-go', { 'do': 'make'}
call plug#end()

set backspace=2             " Fix broken backspace in some setups
set backupcopy=yes          " see :help crontab
set clipboard=unnamed       " yank and paste with the system clipboard
set directory-=.            " don't store swapfiles in the current directory
set encoding=utf-8
set expandtab               " expand tabs to spaces
set ignorecase              " case-insensitive search
set laststatus=2            " always show statusline
set noshowmode              " using airline so mode is unnecessary
set number                  " show line numbers
set ruler                   " show where you are
set scrolloff=3             " show context above/below cursorline
set shiftwidth=4            " normal mode indentation commands use 4 spaces
set showcmd
set smartcase               " case-sensitive search if any caps
set softtabstop=2           " insert mode tab and backspace use 2 spaces
set completeopt+=noselect

" keyboard shortcuts
let mapleader = ','
nmap <leader>p :tabp<CR>
nmap <leader>n :tabn<CR>
nnoremap <leader>k :E<cr> 
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>s <C-w>s
nnoremap ; :
nnoremap <leader>f :Rg<CR>
nnoremap <leader>t :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>1 :b1<CR>
nnoremap <leader>2 :b2<CR>
nnoremap <leader>3 :b3<CR>
nnoremap <leader>4 :b4<CR>
nnoremap <leader>5 :b5<CR>
nnoremap <leader><tab> :bn<CR>
nnoremap <leader><S-tab> :bp<CR>
inoremap <leader><tab> <ESC>:bn<CR>i
inoremap <leader><S-tab> <ESC>:bp<CR>i

" easier window switching
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-c> <C-w>c

" in case you forgot to sudo
cmap w!! %!sudo tee > /dev/null %

" plugin settings
let g:gitgutter_enabled = 1
let g:airline_powerline_fonts = 0
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:deoplete#enable_at_startup = 1
let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.terraform = '[^ *\t"{=$]\w*'
let g:ale_lint_on_text_changed = 'never' " run linters only on save
let g:ale_linters = {
\   'bash': ['shellcheck'],
\   'dockerfile': ['hadolint'],
\   'terraform': ['tflint']
\}

" NERDtree, but via netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 15
let g:netrw_home=$XDG_CACHE_HOME.'/nvim'
" augroup ProjectDrawer
"   autocmd!
"   autocmd VimEnter * :Vexplore
" augroup END<Paste>

" vim-commentary settings for terraform
autocmd FileType terraform setlocal commentstring=#%s

" md is markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown

autocmd! bufwritepost ~/.config/nvim/init.vim source ~/.config/nvim/init.vim " reload init.vim after write
set whichwrap+=<,>,h,l,[,] " Wrap arrow keys between lines
set nocursorline " don't highlight current line

" keyboard shortcuts
inoremap jj <ESC>

" highlight search
nmap <leader>hl :let @/ = ""<CR>

" colors
colorscheme nord

" don't use terminal background color
hi NonText ctermbg=NONE 
set termguicolors

" vim-go settings
set autowrite
let g:go_highlight_types = 1
let g:go_fmt_command = "goimports"
let g:go_metalinter_autosave = 1
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1 " testing this out for now
let g:deoplete#sources#go#gocode_binary = $GOPATH."/bin/gocode"

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#cmd#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r <Plug>(go-run)
" autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <leader>gd <Plug>(go-doc)
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Fix stupid shift key mistakes
cab W! w!
cab Q! q!
cab Wq wq
cab wQ wq
cab WQ wq
cab W w
cab Q q
