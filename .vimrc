syntax on

let mapleader=","

hi Normal ctermbg=none

colorscheme gruvbox

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
set list
set listchars=tab:▸\ ,eol:¬,nbsp:⋅,trail:•
set mouse=a
set nobackup
set nocursorline
set nowrap
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
set number relativenumber
set re=1 " https://github.com/joshukraine/dotfiles/blob/master/vim-performance.md

hi CurrentWord ctermbg=65
hi CurrentWordTwins ctermbg=100

call plug#begin("~/.vim/plugged")
Plug 'bhurlow/vim-parinfer'
Plug 'dense-analysis/ale'
Plug 'dominikduda/vim_current_word'
Plug 'guns/vim-clojure-static'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'l04m33/vlime', {'rtp': 'vim/'}
Plug 'maxboisvert/vim-simple-complete'
Plug 'mileszs/ack.vim'
Plug 'roman/golden-ratio'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-fugitive'
call plug#end()


" vim-fireplace mappings
au BufEnter *.clj nnoremap  <buffer> cpt :Eval<CR>
au BufEnter *.cljs nnoremap <buffer> cpt :Eval<CR>
au BufEnter *.cljs nnoremap <buffer> cpe :%Eval<CR>
au BufEnter *.cljs nnoremap <buffer> cpw :%Eval<CR><CR>


"   system:
nnoremap <leader>w<Left> <C-w>h
nnoremap <leader>w<Down> <C-w>j
nnoremap <leader>w<Up> <C-w>k
nnoremap <leader>w<Right> <C-w>l
" don't jump when highlighting occurrences
nnoremap * *``


"   Clojure rainbow parens:
let g:rainbow_active = 1
let g:rainbow_conf = {
      \  'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
      \  'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
      \  'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
      \  'separately': {
      \      '*': 0,
      \      'clojure': {},
      \      'clojurescript': {},
      \  }
      \}


"   vlime:
let g:vlime_enable_autodoc = v:true
let g:vlime_window_settings = {'sldb': {'pos': 'belowright', 'vertical': v:true}, 'inspector': {'pos': 'belowright', 'vertical': v:true}, 'preview': {'pos': 'belowright', 'size': v:null, 'vertical': v:true}}


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
let g:ale_linters = { "ruby": ["reek", "rubocop"], "javascript": ["eslint"], "python": ["flake8", "pylint"], "clojure": ["clj-kondo", "joker"] }


"    Custom functions
autocmd BufNewFile,BufRead *.rb call AddRubyFileHeaders()
function! AddRubyFileHeaders()
  let l:filename = expand("%")

  call append(0, "# frozen_string_literal: true")
  call append(1, "")

  if filename =~# "_spec\.rb$"
    call append(2, "require 'rails_helper'")
    call append(3, "")
    call append(4, "RSpec.describe  do")
    call append(5, "end")
    call cursor(5, 16)
  endif
endfunction
