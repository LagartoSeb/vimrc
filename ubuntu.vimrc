syntax on

filetype plugin indent on

let mapleader=","

colorscheme badwolf

set backspace=indent,eol,start
set backupcopy=auto
set clipboard=unnamedplus
set colorcolumn=100
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//
set undodir=~/.vim/.undo//
set history=100
set hlsearch
set incsearch
set list
set listchars=tab:▸\ ,eol:¬,nbsp:⋅,trail:•
set mouse=a
set nowrap
set showmatch
set showmode
set splitright
set splitbelow
set swapfile
set t_CO=<t_CO>
set autoindent
set undofile
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*
set writebackup
set number
set re=1 " https://github.com/joshukraine/dotfiles/blob/master/vim-performance.md
set laststatus=2
set relativenumber

hi CurrentWord ctermbg=65
hi CurrentWordTwins ctermbg=100

call plug#begin("~/.vim/plugged")
Plug 'dense-analysis/ale'
Plug 'dominikduda/vim_current_word'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'henrik/vim-ruby-runner'
Plug 'vim-test/vim-test'
Plug '/home/seb/.vim/plugged/me/vim-tmux-runner'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

"   system
nnoremap <leader>w<Left> <C-w>h
nnoremap <leader>w<Down> <C-w>j
nnoremap <leader>w<Up> <C-w>k
nnoremap <leader>w<Right> <C-w>l
"   don't jump when highlighting occurrences
nnoremap * *``
"   zoom buffers¬
noremap <leader>zi <c-w>_ \| <c-w>\|
noremap <leader>zo <c-w>=

"   nerdtree
let g:NERDTreeWinPos="right"
nnoremap <leader><Space> :NERDTreeToggle<CR>

"   fzf
let rgCommand = "rg --column --line-number --no-heading --color=always --smart-case"

function! Capitalize(string)
  return substitute(a:string, '\(\<\w\+\>\)', '\u\1', 'g')
endfunction

function! RgWrapper(identificator, query)
  call fzf#vim#grep(printf(printf(" %s '%s'", g:rgCommand, a:identificator), a:query), 1, fzf#vim#with_preview(), 0)
endfunction

command! -nargs=* -bang FindMethodInstance   call RgWrapper("def +%s",      <q-args>)
command! -nargs=* -bang FindMethodClass      call RgWrapper("def +self.%s", <q-args>)
command! -nargs=* -bang FindConstant         call RgWrapper("%s += +",      toupper(<q-args>))
command! -nargs=* -bang FindClass            call RgWrapper("class +%s",    Capitalize(<q-args>))
command! -nargs=* -bang FindModule           call RgWrapper("module +%s",   Capitalize(<q-args>))
command! -nargs=* -bang FindVariableGlobal   call RgWrapper("\\$%s += +",   <q-args>)
command! -nargs=* -bang FindVariableClass    call RgWrapper("@@%s += +",    <q-args>)
command! -nargs=* -bang FindVariableInstance call RgWrapper("@%s += +",     <q-args>)
command! -nargs=* -bang FindVariableLocal    call RgWrapper("%s += +",      <q-args>)
command! -nargs=* -bang FindMemoization      call RgWrapper("@%s +||= +",   <q-args>)
command! -nargs=* -bang FindOccurrence       call RgWrapper("%s",           <q-args>)

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

inoremap ,, <Esc>:w<CR>

"   ale
packloadall
silent! helptags ALL<Paste>
let g:ale_linters = { "ruby": ["standardrb"] }

func! Note(...)
  exec "sp " . expand('~/Documents/zettlr/') . strftime('%Y/%m/%Y%m%d%H%M%S') . '.md'
endfunc

command! -nargs=* Note call Note(<f-args>)

let g:ale_echo_msg_format = '💩 %linter% 💩 %s'

" Run ruby code using leader-r only when inside a .rb file
" Overriden by the henrik/vim-ruby-runner
" au BufRead, *.rb nmap <leader>z :!ruby %<cr>

" Set a filetype: https://github.com/henrik/vim-ruby-runner
" command! FR set filetype=ruby

" The default <Leader>r runs the Ruby file and keeps the focus in the output, this is otherwise.
let g:RubyRunner_keep_focus_key = '<Leader>r'
" By default the windows size is always half of the window, this makes it smaller.
let g:RubyRunner_window_size = 5

" vim-test mappings
nmap <silent> <C-n> :TestNearest<CR>
nmap <silent> <C-f> :TestFile<CR>
nmap <silent> <C-x> :TestSuite<CR>
nmap <silent> <C-l> :TestLast<CR>
nmap <silent> <C-:> :TestVisit<CR>

" vim-tmux-runner, run ruby tests with vim-test and vim-tmux-runner
let test#strategy = "vtr"
" let test#ruby#rspec#options = {'all': '--backtrace --format documentation'}
let test#ruby#rspec#options = {'all': '--format documentation'}

" solution to make terminal mode, ESC and arrows work
tnoremap <Esc> <C-W>N
tnoremap <Esc><Esc> <C-W>N
set timeout timeoutlen=1000  " Default
set ttimeout ttimeoutlen=100  " Set by defaults.vim

" Coc mappings
" nmap <leader>gd :call CocAction('jumpDefinition', 'vsplit')<CR>
" nmap <leader>gr <Plug>(coc-references)
" nmap <leader>gy <Plug>(coc-type-definition)
" nmap <leader>gi <Plug>(coc-implementation)
" inoremap <silent><expr> <TAB>
"   \ pumvisible() ? "\<C-n>" :
"   \ <SID>check_back_space() ? "\<TAB>" :
"   \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" 
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
" 
" let g:coc_global_extensions = ['coc-solargraph']
