colorscheme badwolf

" Needed for Hyperterm correct behaviour
set encoding=utf-8

" Needed for Vundle
set nocompatible
filetype plugin on 

set guifont=Fura\ Code:h12

" Vim-Plug plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'andreyorst/SimpleSnippets-snippets'
Plug 'andreyorst/SimpleSnippets.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'dyng/ctrlsf.vim'
Plug 'mattn/emmet-vim'
Plug 'jalvesaq/vimcmdline'
Plug 'joshdick/onedark.vim'
Plug 'mileszs/ack.vim'
Plug 'ruanyl/vim-gh-line'
Plug 'sheerun/vim-polyglot'
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rhubarb'
Plug 'w0rp/ale'
Plug 'ElmCast/elm-vim'
Plug 'junegunn/vim-easy-align'
Plug 'isRuslan/vim-es6'
Plug 'kien/ctrlp.vim'
Plug 'henrik/vim-ruby-runner'
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdtree' 
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'Townk/vim-autoclose'
Plug 'tpope/vim-commentary'
Plug 'terryma/vim-multiple-cursors'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'tpope/vim-surround'
Plug 'ervandew/supertab'
Plug 'sjl/badwolf'
call plug#end()

" RSpec.vim mappings
map <Leader>lc :call RunCurrentSpecFile()<CR>
map <Leader>ls :call RunNearestSpec()<CR>
map <Leader>ñl :call RunLastSpec()<CR>
map <Leader>ña :call RunAllSpecs()<CR>

" Configure for Ruby development
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
autocmd BufAdd BufRead filetype detect

set colorcolumn
set wildignore+=*/tmp/*,*.so,*.swp,*.zip  " Exclude files in /tmp - *nix
set statusline=%{FugitiveStatusline()}
set nobackup                      " Do not generate .sw or backup files.
set autoread                      " Enables autoload for files that change when are open
set autoindent                    " Enables a new line with the same indentation
set clipboard=unnamedplus         " Use system clipboard for copy and paste.
syntax on                         " Enable syntax
set t_CO=256                      " Use 256 colors, terminal vim
set nowrap                        " Quit wrapping in all files.
set noswapfile                    " Do not generate swap files.
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
set expandtab                     " Use tabs, no spaces.
set relativenumber
set list
set listchars=tab:▸\ ,eol:¬,nbsp:⋅,trail:•
set laststatus=2                  " With 2 makes the Powerline bar appear all time.
let mapleader=","                 " Change leader to comma key.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" Functions

" Relative numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
    set number
  else
    set rnu
  endif
endfunc

" Toggle between normal and relative numbering.
nnoremap <leader>re :call NumberToggle()<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" Mappings

" vnoremap's
map <leader>cc :w !xsel -i -b<CR>

" IndentLine configuration
let g:indentLine_enabled = 0 " Disabled by default 
" Toggle IndentLines plugin
nnoremap <leader>li :IndentLinesToggle<cr> 

" CtrlP configuration
map <leader>p :CtrlPBuffer<CR>

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
" Give to ; the same functionality that :
nnoremap ; :
" Reselect the text that was pasted previously.
nnoremap <leader>v V`]
" Fast go the first line, last line, and middle line, last and first character in the current line
nnoremap <S-Right> $
nnoremap <S-Left> 0
" Jump to the middle of the current line
nnoremap gm :call cursor(0, len(getline('.'))/2)<CR>

" Insert mode mappings
inoremap <leader>o <C-o>
inoremap <leader>a <C-o>I
inoremap <leader>s <C-o>A
inoremap ,, <Esc>:w<CR>
inoremap ,dw <Esc>ciw
" Keep identation when creating a new line
inoremap <C-Return> <CR><CR><C-o>k<Tab>
" Keep identation when opening curly braces
inoremap { {<CR>}<up><end><CR>

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

let g:AutoClosePairs = "() <> [] {} ''"

" YouCompleteMe config.
let g:ycm_server_python_interpreter = '/usr/bin/python'

" Ruby Runner configuration
let g:RubyRunner_open_below = 1
let g:RubyRunner_window_size = 5
let g:RubyRunner_keep_focus_key = '<Leader>r' " Run Ruby Runner but keep focus on file

" CtrlP
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist|tmp)|(\.(swp|ico|git|svn))$'

" Silent highlight search 
nmap <silent> ./ :nohlsearch<CR>

" VimEasyAlign configuration
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Terminal Mappings
tnoremap <Esc> <C-\><C-n>

" ALE
  " Load all plugins now.
  " Plugins need to be added to runtimepath before helptags can be generated.
packloadall
  " Load all of the helptags now, after plugins have been loaded.
  " All messages and errors will be ignored.
silent! helptags ALL<Paste>
  " Configure Fixers
let g:ale_linters = { 'ruby': ['rubocop'], 'javascript': ['eslint'] }

" VIM-AIRLINE
let g:airline_powerline_fonts = 1 " Populate the dictionary with the powerline symbols.
let g:airline#extensions#tabline#buffer_nr_show = 1 " Show buffer number
let g:airline#extensions#hunks#enabled = 0 " Show current working branch name
let g:airline#extensions#branch#enabled = 1 " Show current working branch name

" VIMCMDLine
let cmdline_map_start = '<Leader>oc'            " Open a console (Open Console)
let cmdline_map_quit = '<Leader>qc'             " Quit the console (Quit Console)
" let cmdline_map_send_and_stay = '<Leader>cs'  " Send and stay in console (Console Stay)
" let cmdline_map_source_fum = '<Leader>fc'     " Send entire file to console (File to Console)
let cmdline_map_send           = '<Space>'
let cmdline_follow_colorscheme = 1              " Color Configuration

" The Silver Researcher + Ack.vim
let g:ackprg = 'ag --nogroup --nocolor --column'

" vim-multicursor
let g:multi_cursor_quit_key = ',,'

" Deoplete
let g:deoplete#enable_at_startup = 1
