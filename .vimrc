syntax on

colorscheme badwolf

let mapleader=","

hi Normal ctermbg=none

set autoindent
set backspace=indent,eol,start
if has("patch-8.1.0251") | set backupdir^=~/.vim/backup// | endif
set backupcopy=auto
set clipboard=unnamed
set colorcolumn=100
set directory^=~/.vim/swap//
set expandtab
set history=100
set hlsearch
set incsearch
set list " invisibles config. related
set listchars=tab:▸\ ,eol:¬,nbsp:⋅,trail:•
set mouse=a
set nobackup
set nocursorline
set nowrap
set number
set shiftwidth=2
set showmatch
set showmode
set softtabstop=2
set splitright
set swapfile
set t_CO=256
set tabstop=2
set undodir^=~/.vim/undo//
set undofile
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*
set writebackup

call plug#begin("~/.vim/plugged")
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'roman/golden-ratio'
Plug 'scrooloose/nerdtree'
Plug 'sjl/badwolf'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
" Plug 'dense-analysis/ale'
call plug#end()

" CONFIGURATION
"   system:
nnoremap <leader>w<Left> <C-w>h
nnoremap <leader>w<Down> <C-w>j
nnoremap <leader>w<Up> <C-w>k
nnoremap <leader>w<Right> <C-w>l

"   nerdtree:
let g:NERDTreeWinPos="right"
nnoremap <leader>z :NERDTreeToggle<CR>

" fzf
nnoremap <C-p> :Files<Cr>
nnoremap <C-b> :Buffers<Cr>
" find definition
nnoremap <Leader>fd :Ag def <C-R><C-W>$<CR>
" find usage
nnoremap <Leader>fu :Ag <C-R><C-W><CR>

"   ale:
packloadall
silent! helptags ALL<Paste>
let g:ale_linters = { "ruby": ["reek", "rubocop"], "javascript": ["eslint"], "python": ["flake8", "pylint"] }
