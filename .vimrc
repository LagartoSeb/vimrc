" yg_ copy                        from cursor to end line
" vG select                       from cursor to the bottom
" :g/_pattern_/s/^/#/g            will comment out lines containing _pattern_
" "*y                             copy te selection to clipboard
" *                               highlight all the ocurrences in the cursor

" Needed for pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on

" Needed for Vundle
set nocompatible
" filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundle plugins
Plugin 'gmarik/vundle'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" Colorscheme
colorscheme Tomorrow-Night-Bright

set clipboard=unnamedplus         " Enable copy selection to clipboard 
set nowrap                        " Quit wrapping in all files.
set mouse=a                       " Enable mouse integration.
set cursorline                    " Highlight the cursor line.
set showmode                      " Show the current mode.
set ignorecase                    " Enable functionality to upper and downcase search.
set smartcase                     " Enable functionality to upper and downcase search.
set hlsearch                      " Highlight the search occurrences.
set incsearch                     " Better search experience.
set showmatch                     " Better search experience.
set number                        " Set number lines.
set paste                         " Set formatted paste.
set backspace=indent,eol,start    " Make backspace behave like every other editor.
set history=100                   " Increase the buffer capacity.
set tabstop=4                     " Tab settings.
set shiftwidth=4                  " Tab settings.
set softtabstop=4                 " Tab settings.
set expandtab                     " Tab settings.
let mapleader=","                 " Change leader to comma key.

set list
set listchars=tab:▸\ ,eol:¬

set laststatus=2                  " Make the Powerline bar appear all time.
set dir=/tmp                      " Change the swap directory.
let g:airline_powerline_fonts = 1 " Populate the dictionary with the powerline symbols.

" NERDTree config.
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

inoremap <leader><Tab> <C-x><C-o>

nmap ,oo :on<CR>
nmap ,nh :nohl<CR>
nmap ,ev :e $MYVIMRC<CR>
nmap ,bd :bd<CR>
nmap ,script :scriptnames<CR>
nmap ,gv :e /Applications/MacVim.app/Contents/Resources/vim/gvimrc<CR>
nmap ,sc :source %<CR>

" Map copy and paste
vmap <C-c> "ay 
nmap <C-v> "aP
vmap <C-x> "ayd

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
