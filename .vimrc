" Let the magic begin
call plug#begin()
" easy vim stuff
Plug 'fatih/vim-go'
" comment stuff easy
Plug 'scrooloose/nerdcommenter'
" make life more easy
Plug 'tpope/vim-unimpaired'
" file explorer
Plug 'ctrlpvim/ctrlp.vim'
" show lines that have changed
Plug 'airblade/vim-gitgutter'
" make them pair
Plug 'jiangmiao/auto-pairs'
" completion
Plug 'Valloric/YouCompleteMe', { 'do': './install.py'  }
Plug 'junegunn/seoul256.vim'
Plug 'chiedojohn/vim-case-convert'
call plug#end()

" ================ General Config ====================

set nocompatible
set completeopt+=noinsert,menuone,longest,noselect
set completeopt-=preview
set term=screen-256color

let mapleader      = ' '
let maplocalleader = ' '

filetype plugin indent on

set backspace=2 	" Backspace deletes like most programs in insert mode
set hidden
set history=100
set ruler		        " show the cursor position all the time
set showcmd 		    " display incomplete commands
set incsearch		    " do incremental searching
set laststatus=2	  " always display the status line
set autowrite		    " automatically :write before running commands
set autoread        " Reload files changed outside vim

syntax enable
colorscheme onedark
set background=dark

augroup vimrcEx
  autocmd!

  " When editing a filem always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \ exe "normal g`\"" |
    \ endif

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Line numbers
set number
set numberwidth=1

" Display extra whitespace
set list listchars=tab:»·,trail:¬,nbsp:¬

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

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
nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader><Leader> <c-^>
nnoremap <silent><leader>n :set rnu! rnu? <cr>

" ignore everything in gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Trigger configuration. Do not use <tab> if you use
let g:UltiSnipsExpandTrigger="<c-x>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" replace selection
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
