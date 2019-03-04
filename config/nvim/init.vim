colorscheme badwolf

" Needed for Hyperterm correct behaviour
set encoding=utf-8

" Needed for Vundle
set nocompatible
filetype plugin on 

" Vim-Plug plugins
call plug#begin()
Plug 'ElmCast/elm-vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Townk/vim-autoclose'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/vim-easy-align'
Plug 'kien/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'misterbuckley/vim-definitive'
Plug 'ruanyl/vim-gh-line'
Plug 'scrooloose/nerdtree' 
Plug 'sheerun/vim-polyglot'
Plug 'sjl/badwolf'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'w0rp/ale'
Plug 'luochen1990/rainbow'
call plug#end()

" Configure for Ruby development
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
autocmd BufAdd BufRead filetype detect

let mapleader=","                 " Change leader to comma key.
set autoindent                    " Enables a new line with the same indentation
set autoread                      " Enables autoload for files that change when are open
set backspace=indent,eol,start    " Make backspace behave like every other editor.
set clipboard=unnamedplus         " Use system clipboard for copy and paste.
set colorcolumn=100
set expandtab                     " Use tabs, no spaces.
set history=100                   " Increase the buffer capacity.
set hlsearch                      " Highlight the search occurrences.
set ignorecase                    " Enable functionality to upper and downcase search.
set incsearch                     " Better search experience.
set laststatus=0                  " With 2 makes the Powerline bar appear all time.
set list
set listchars=tab:‚ñ∏\ ,eol:¬¨,nbsp:‚ãÖ,trail:‚Ä¢
set mouse=a                       " Enable mouse integration.
set undofile                      " Maintain undo history between sessions
set undodir=~/.config/nvim/undodir
set nowrap                        " Quit wrapping in all files.
set number
set shiftwidth=2                  " Tab settings.
set showmatch                     " Better search experience.
set showmode                      " Show the current mode.
set smartcase                     " Enable functionality to upper and downcase search.
set softtabstop=2                 " Tab settings.
set splitright                    " Open the vertical windows always to the right.
set statusline=%{FugitiveStatusline()}
set t_CO=256                      " Use 256 colors, terminal vim
set tabstop=2                     " Tab settings.
set wildignore+=*/tmp/*,*.so,*.swp,*.zip  " Exclude files in /tmp - *nix
syntax on                         " Enable syntax
set nocursorline

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" Functions

function! SyntaxToggle()
  if(exists("g:syntax_on"))
    syntax off
  else
    syntax enable
  endif
endfunc

" Toggle between syntax enabled or disabled
nnoremap <leader><Space> :call SyntaxToggle()<cr>

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
nnoremap <silent> <Leader>v :NERDTreeFind<CR>
let g:NERDTreeWinPos = "right"

set runtimepath^=~/.vim/bundle/ctrlp.vim
nnoremap <leader>w<Left> <C-w>h
nnoremap <leader>w<Down> <C-w>j
nnoremap <leader>w<Up> <C-w>k
nnoremap <leader>w<Right> <C-w>l
" Jump to the middle of the current line
nnoremap gm :call cursor(0, len(getline('.'))/2)<CR>

" Insert mode mappings
inoremap <leader>o <C-o>
inoremap <leader>a <C-o>I
inoremap <leader>s <C-o>A
inoremap ,dw <Esc>ciw
inoremap ,, <Esc>:w<CR>
" Keep identation when creating a new line
inoremap <C-Return> <CR><CR><C-o>k<Tab>
" Keep identation when opening curly braces
inoremap { {<CR>}<up><end><CR>

" Symbols for NERDTree-Git-Plugin
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "‚úπ",
    \ "Staged"    : "‚úö",
    \ "Untracked" : "‚ú≠",
    \ "Renamed"   : "‚ûú",
    \ "Unmerged"  : "‚ïê",
    \ "Deleted"   : "‚úñ",
    \ "Dirty"     : "‚úó",
    \ "Clean"     : "‚úîÔ∏é",
    \ "Unknown"   : "?"
    \ }
let NERDTreeIgnore = ['\.pyc$']  " Ignore .pyc files in the tree, separate them by comma

let g:AutoClosePairs = "() <> [] {} ''"

" CtrlP
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist|tmp)|(\.(swp|ico|git|svn))$'

" Silent highlight search 
nmap <silent> ./ :nohlsearch<CR>

" ALE
  " Load all plugins now.
  " Plugins need to be added to runtimepath before helptags can be generated.
packloadall
  " Load all of the helptags now, after plugins have been loaded.
  " All messages and errors will be ignored.
silent! helptags ALL<Paste>
  " Configure Fixers
let g:ale_linters = {
  \ 'ruby':       ['brakeman', 'reek', 'rubocop'],
  \ 'javascript': ['eslint'],
  \ 'python':     ['flake8', 'pylint']
  \ }

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

" Deoplete
let g:deoplete#enable_at_startup = 1
" vim-definitive
nnoremap <Leader>fd :FindDefinition<CR>

" Neovim configuration.
let g:ruby_host_prog = '/Users/seb/.rbenv/shims/ruby'
let g:python3_host_prog = '/Users/seb/anaconda3/bin/python'

" luochen1990/rainbow
let g:rainbow_active = 1
let g:rainbow_conf = {
      \	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
      \	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
      \	'operators': '_,_',
      \	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
      \	'separately': {
      \		'*': {},
      \		'tex': {
      \			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
      \		},
      \		'lisp': {
      \			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
      \		},
      \		'vim': {
      \			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
      \		},
      \		'html': {
      \			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
      \		},
      \		'css': 0,
      \	}
      \}
