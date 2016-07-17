" Let the magic begin
call plug#begin()
"" easy vim stuff
Plug 'fatih/vim-go'
" comment stuff easy
Plug 'scrooloose/nerdcommenter'
" make life more easy
Plug 'tpope/vim-unimpaired'
" show lines that have changed
Plug 'airblade/vim-gitgutter'
Plug 'raimondi/delimitmate'
" completion
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --racer-completer' }
Plug 'junegunn/fzf', { 'dir': '~/.zplug/repos/junegunn/fzf' }
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'wellle/targets.vim'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/goyo.vim'
Plug 'takac/vim-hardtime'
Plug 'myusuf3/numbers.vim'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'easymotion/vim-easymotion'
Plug 'mhartington/oceanic-next'
Plug 'vim-airline/vim-airline'
Plug 'pangloss/vim-javascript'
Plug 'othree/yajs.vim'
Plug 'mxw/vim-jsx'
Plug 'neomake/neomake'
call plug#end()

" ================ General Config ====================

set nocompatible
set completeopt+=noinsert,menuone,longest,noselect
set completeopt-=preview

let mapleader      = ' '
let maplocalleader = ' '

filetype plugin indent on

set backspace=2 	" Backspace deletes like most programs in insert mode
set hidden
set ruler		        " show the cursor position all the time
set showcmd 		    " display incomplete commands
set laststatus=2	  " always display the status line

syntax enable
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme OceanicNext
set background=dark

" set airline theme
let g:airline_theme='oceanicnext'


augroup vimrcEx
  autocmd!

  " When editing a filem always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \ exe "normal g`\"" |
    \ endif

" Softtabs, 4 spaces, cause php
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Disable mouse
set mouse-=a

" Line numbers
set number
set numberwidth=1

" Display extra whitespace
set list listchars=tab:»·,trail:¬,nbsp:¬

" Open new splits panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

" Scrolling

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Allow using repeat operator with a visual selection
vnoremap . :mornal .<CR>

" For when you forget to sudo... Really write the file.
cmap w!! w ! sudo tee % >/dev/null

" Wrapped lines goes down/up to next row, rather than next line in file
noremap j gj
noremap k gk

" Map frequent actions
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>. :FZF<CR>
nnoremap <Leader><Leader> <c-^>
nnoremap <silent><leader>n :set rnu! rnu? <cr>

" replace selection
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_at_startup = 1

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" delete stuff
command! -complete=file -nargs=1 Remove :echo 'Remove: '.'<f-args>'.' '.(delete(<f-args>) == 0 ? 'SUCCEEDED' : 'FAILED')

" jsx
let g:jsx_ext_required = 0

" easymotion
map <Leader> <Plug>(easymotion-prefix)
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" jsx enabled in js files
let g:jsx_ext_required = 0

" neomake makers
let g:neomake_open_list=2
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_jsx_enabled_makers = ['eslint']
let g:neomake_javascript_eslint_maker = {
\ 'args': ['--no-color', '--format', 'compact'],
\ 'errorformat': '%f: line %l\, col %c\, %m'
\ }

autocmd! BufWritePost * Neomake
