syntax on

let mapleader=","

colorscheme gruvbox

set autoindent
set backspace=indent,eol,start
if has("patch-8.1.0251") | set backupdir^=~/.vim/backup// | endif
set backupcopy=auto
set clipboard=unnamed
set colorcolumn=100
set directory^=~/.vim/swap//
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
set splitright
set swapfile
set t_CO=256
set tabstop=2
set softtabstop=2
set expandtab
set undodir^=~/.vim/undo//
set undofile
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*
set writebackup
set number relativenumber
set re=1 " https://github.com/joshukraine/dotfiles/blob/master/vim-performance.md
set cursorcolumn
set cursorline
set laststatus=2

hi CurrentWord ctermbg=65
hi CurrentWordTwins ctermbg=100

call plug#begin("~/.vim/plugged")
Plug 'dense-analysis/ale'
Plug 'dominikduda/vim_current_word'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'maxboisvert/vim-simple-complete'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
call plug#end()


"   system
nnoremap <leader>w<Left> <C-w>h
nnoremap <leader>w<Down> <C-w>j
nnoremap <leader>w<Up> <C-w>k
nnoremap <leader>w<Right> <C-w>l
"   don't jump when highlighting occurrences
nnoremap * *``
"   zoom buffers¬
noremap Zi <c-w>_ \| <c-w>\|
noremap Zo <c-w>=


"   nerdtree
let g:NERDTreeWinPos="right"
nnoremap <leader>z :NERDTreeToggle<CR>


"   fzf
let rgCommand = 'rg --column --line-number --no-heading --color=always --smart-case'

function! Capitalize(string)
  return substitute(a:string, '\(\<\w\+\>\)', '\u\1', 'g')
endfunction

function! RgWrapper(identificator, query)
  call fzf#vim#grep(printf(printf(" %s '%s'", g:rgCommand, a:identificator), a:query), 1, fzf#vim#with_preview(), 0)
endfunction

command! -nargs=* -bang FindMethodInstance   call RgWrapper("def %s",      <q-args>)
command! -nargs=* -bang FindMethodClass      call RgWrapper("def self.%s", <q-args>)
command! -nargs=* -bang FindConstant         call RgWrapper("%s = ",       toupper(<q-args>))
command! -nargs=* -bang FindClass            call RgWrapper("class %s",    Capitalize(<q-args>))
command! -nargs=* -bang FindModule           call RgWrapper("module %s",   Capitalize(<q-args>))
command! -nargs=* -bang FindVariableGlobal   call RgWrapper("\\$%s = ",    <q-args>)
command! -nargs=* -bang FindVariableClass    call RgWrapper("@@%s = ",     <q-args>)
command! -nargs=* -bang FindVariableInstance call RgWrapper("@%s = ",      <q-args>)
command! -nargs=* -bang FindVariableLocal    call RgWrapper("%s = ",       <q-args>)
command! -nargs=* -bang FindMemoization      call RgWrapper("@%s ||= ",    <q-args>)
command! -nargs=* -bang FindOccurrence       call RgWrapper("%s",          <q-args>)

nnoremap <C-b> :Buffers<Cr>
nnoremap <C-p> :Files<Cr>
nnoremap <C-l> :Lines<Cr>
nnoremap <C-g> :Rg<Cr>

"   find functions
nnoremap <Leader>fim :FindMethodInstance   <C-R><C-W><CR>
nnoremap <Leader>fcm :FindMethodClass      <C-R><C-W><CR>
nnoremap <Leader>fco :FindConstant         <C-R><C-W><CR>
nnoremap <Leader>fcl :FindClass            <C-R><C-W><CR>
nnoremap <Leader>fmo :FindModule           <C-R><C-W><CR>
nnoremap <Leader>fgv :FindVariableGlobal   <C-R><C-W><CR>
nnoremap <Leader>fcv :FindVariableClass    <C-R><C-W><CR>
nnoremap <Leader>fiv :FindVariableInstance <C-R><C-W><CR>
nnoremap <Leader>flv :FindVariableLocal    <C-R><C-W><CR>
nnoremap <Leader>fme :FindMemoization      <C-R><C-W><CR>
nnoremap <Leader>fo  :FindOccurrence       <C-R><C-W><CR>


"   ale
packloadall
silent! helptags ALL<Paste>
let g:ale_linters = { "ruby": ["reek", "rubocop"], "javascript": ["eslint"], "python": ["flake8", "pylint"], "clojure": ["clj-kondo", "joker"] }


"    Custom functions
" autocmd BufNewFile,BufRead *.rb call AddRubyFileHeaders()
" function! AddRubyFileHeaders()
"   let l:filename = expand("%")
" 
"   call append(0, "# frozen_string_literal: true")
"   call append(1, "")
" 
"   if filename =~# "_spec\.rb$"
"     call append(2, "require 'rails_helper'")
"     call append(3, "")
"     call append(4, "RSpec.describe  do")
"     call append(5, "end")
"     call cursor(5, 16)
"   endif
" endfunction
