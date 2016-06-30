" yg_                             copy from cursor to end line
" vG                              select from cursor to the bottom
" :g/_pattern_/s/^/#/g            will comment out lines containing _pattern_
" "*y                             copy te selection to clipboard
" *                               highlight all the ocurrences in the cursor
" :m                              move to X line
" :g/#/d                          remove all lines that begin with #

" Needed for Vundle
set nocompatible
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()
syntax on

" Vundle plugins
Plugin 'mileszs/ack.vim'  " ack.vim
Plugin 'kien/ctrlp.vim' " ctrlp.vim
Plugin 'mattn/emmet-vim' " emmet-vim
Plugin 'sjl/gundo.vim' " gundo.vim
Plugin 'Shougo/neocomplcache.vim' " neocomplcache.vim
Plugin 'scrooloose/nerdcommenter' " nerdcommenter
Plugin 'Xuyuanp/nerdtree-git-plugin' " nerdtree-git-plugin
Plugin 'scrooloose/nerdtree' " nerdtree
Plugin 'ervandew/supertab' " supertab
" Plugin 'syntastic' 
Plugin 'vim-airline/vim-airline' " vim-airline
Plugin 'junegunn/vim-easy-align' " vim-easy-align
Plugin 'tpope/vim-fugitive' " vim-fugitive
Plugin 'airblade/vim-gitgutter' " vim-gitgutter
Plugin 'elzr/vim-json' " vim-json
Plugin 'matze/vim-move' " vim-move
Plugin 'mhinz/vim-signify' " vim-signify
Plugin 'tpope/vim-vinegar' " vim-vinegar
Plugin 'gmarik/vundle' " vundle

map easy <Plug>(easymotion-s)

" Colorscheme
colorscheme Tomorrow-Night-Bright

set nowrap                        " Quit wrapping in all files.
set mouse=a                       " Enable mouse integration.
set cursorline                    " Highlight the cursor line.
set showmode                      " Show the current mode.
set ignorecase                    " Enable functionality to upper and downcase search.
set smartcase                     " Enable functionality to upper and downcase search.
set hlsearch                      " Highlight the search occurrences.
set incsearch                     " Better search experience.
set showmatch                     " Better search experience.
" set number                        " Set number lines.
set relativenumber
set backspace=indent,eol,start    " Make backspace behave like every other editor.
set history=100                   " Increase the buffer capacity.
set tabstop=4                     " Tab settings.
set shiftwidth=4                  " Tab settings.
set softtabstop=4                 " Tab settings.
set expandtab                     " Tab settings.
set tabstop=4                     " Tab size 4 spaces
set noexpandtab                   " Use tabs, no spaces.
let mapleader=","                 " Change leader to comma key.

set list
set listchars=tab:▸\ ,eol:¬

set laststatus=2                  " Make the Powerline bar appear all time.
set dir=/tmp                      " Change the swap directory.
let g:airline_powerline_fonts = 1 " Populate the dictionary with the powerline symbols.

" CtrlP configuration
map <leader>p :CtrlPBuffer<CR>
let g:ctrlp_match_window_bottom   = 0
let g:ctrlp_match_window_reversed = 0

" NERDTree configuration
nnoremap <leader>z :NERDTreeToggle<CR>

"---------------------------------- Mappings ---------------------------------"
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

nmap ,Gt :GundoToggle<CR>
nmap ,Gh :GundoHide<CR>
nmap ,re :%retab!<CR>
nmap ,sn :set nopaste<CR>
nmap ,sp :set paste<CR>
nmap ,pi :PluginInstall<CR>
nmap ,oo :on<CR>
nmap ,nh :nohl<CR>
nmap ,ev :e $MYVIMRC<CR>
nmap ,bd :bd<CR>
nmap ,script :scriptnames<CR>
nmap ,gv :e /Applications/MacVim.app/Contents/Resources/vim/gvimrc<CR>
nmap ,sc :source %<CR>
nmap ,cp :set clipboard=unnamedplus<CR>
nmap ,rn :set relativenumber<CR>
nmap ,qa :qa<CR>
nmap ,w  :w<CR>
nmap ,vs :vsplit<CR>
nmap ,ss :split<CR>

" Automatically source the .vimrc file on save
" autocmd BufWritePost .vimrc source %

" Map EasyAlign
xmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

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

" NeoComplCache
let g:neocomplcache_enable_at_startup = 1

" Vim-Move
let g:move_key_modifier = 'S'
