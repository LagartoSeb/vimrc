colorscheme jellybeans

" Needed for Hyperterm correct behaviour
set encoding=utf-8

" Needed for Vundle
set nocompatible
filetype plugin on 
" filetype off

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdtree' 
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'vim-airline/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-vinegar'
Plugin 'Townk/vim-autoclose'

syntax on                         " Enable syntax
set t_CO=256                      " Use 256 colors, terminal vim
set nowrap                        " Quit wrapping in all files.
set mouse=a                       " Enable mouse integration.
set cursorline                    " Highlight the cursor line.
set showmode                      " Show the current mode.
set ignorecase                    " Enable functionality to upper and downcase search.
set smartcase                     " Enable functionality to upper and downcase search.
set hlsearch                      " Highlight the search occurrences.
set incsearch                     " Better search experience.
set showmatch                     " Better search experience.
set backspace=indent,eol,start    " Make backspace behave like every other editor.
set history=100                   " Increase the buffer capacity.
set tabstop=2                     " Tab settings.
set shiftwidth=2                  " Tab settings.
set softtabstop=2                 " Tab settings.
set noexpandtab                   " Use tabs, no spaces.
let mapleader=","                 " Change leader to comma key.

set list
set listchars=tab:\ \ ,eol:¬

set laststatus=2                  " Make the Powerline bar appear all time.
set dir=/tmp                      " Change the swap directory.
let g:airline_powerline_fonts = 1 " Populate the dictionary with the powerline symbols.

" CtrlP configuration
map <leader>p :CtrlPBuffer<CR>
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'
let g:ctrlp_working_path_mode = 0

" CtrlP auto cache clearing.
function! SetupCtrlP()
  if exists("g:loaded_ctrlp") && g:loaded_ctrlp
    augroup CtrlPExtension
      autocmd!
      autocmd FocusGained  * CtrlPClearCache
      autocmd BufWritePost * CtrlPClearCache
    augroup END
  endif
endfunction
if has("autocmd")
  autocmd VimEnter * :call SetupCtrlP()
endif

" NERDTree configuration
nnoremap <leader>z :NERDTreeToggle<CR>

set runtimepath^=~/.vim/bundle/ctrlp.vim
nnoremap <leader>w<Left> <C-w>h
nnoremap <leader>w<Down> <C-w>j
nnoremap <leader>w<Up> <C-w>k
nnoremap <leader>w<Right> <C-w>l
nnoremap <leader>ack :Ack
" Give to ; the same functionality that :
nnoremap ; :
" Reselect the text that was pasted previously.
nnoremap <leader>v V`]
" Fast go the first line, last line, and middle line, last and first character in the current line
nnoremap <S-Up> gg
nnoremap <S-Down> G
nnoremap <S-m> M
nnoremap <S-Right> $
nnoremap <S-Left> 0

" Insert mode mappings
inoremap <leader>o <C-o>
inoremap <leader>a <C-o>I
inoremap <leader>s <C-o>A
inoremap ,, <Esc>
inoremap ,dw <Esc>ciw

" Symbols for NERDTree-Git-Plugin
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }
let NERDTreeIgnore = ['\.pyc$']  " Ignore .pyc files in the tree, separate them by comma

let g:AutoClosePairs = "() <> [] {} \"""
