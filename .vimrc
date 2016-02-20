" Let the magic begin

call plug#begin()
Plug 'fatih/vim-go'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/syntastic'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'valloric/youcompleteme', { 'do': './install.py' }
Plug 'scrooloose/nerdcommenter'
Plug 'easymotion/vim-easymotion'
call plug#end()

" ================ General Config ====================

set completeopt+=noinsert,menuone,longest,noselect

" Leader is comma
let mapleader = ","

filetype plugin indent on

set backspace=2 	" Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile
set history=100
set ruler		        " show the cursor position all the time
set showcmd 		    " display incomplete commands
set incsearch		    " do incremental searching
set laststatus=2	  " always display the status line
set autowrite		    " automatically :write before running commands
set autoread        " Reload files changed outside vim
syntax on

set background=dark

set rtp+=~/.fzf
nnoremap <leader>o :Files<cr>

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
set numberwidth=5

" Display extra whitespace
set list listchars=tab:»·,trail:¬,nbsp:¬

" Don't use them arrows
nnoremap <Left> :echoe "Use h please, you will learn the magic soon"<CR>
nnoremap <Right> :echoe "Use l please, you will learn the magic soon"<CR>
nnoremap <Up> :echoe "Use k please, you will learn the magic soon"<CR>
nnoremap <Down> :echoe "Use j please, you will learn the magic soon"<CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Switch between the last two files
nnoremap <Leader><Leader> <c-^>

" Run commands that require an interactive shell
nnoremap <Leader>r : runInIntractiveShell<space>

" Treat <li> and <p> like the blocks tags they are
let g:html_indent_tags = 'li\|p'

" Open new splits panes to right and bottom, which feels more natural
set splitbelow
set splitright

" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]

" Autocomplete with dictionary words when spell check is on
set complete+=kspell

" Always use vertical diffs
set diffopt+=vertical

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ================ Scrolling ========================

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

" disable mouse
set mouse=

" Wrapped lines goes down/up to next row, rather than next line in file
noremap j gj
noremap k gk

" Map frequent actions
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>

" Region expanding with v and <C-v>
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" set ctrlp config
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

"------------------------------------------------------------------------------
"" Vim-go
"------------------------------------------------------------------------------
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "gofmt" "Explicited the formater plugin (gofmt,
"goimports, goreturn...)

" Show a list of interfaces which is implemented by the type under your
au FileType go nmap <Leader>s <Plug>(go-implements)

" Show type info for the word under your cursor
au FileType go nmap <Leader>i <Plug>(go-info)

" Open the relevant Godoc for the word under the cursor
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

"" Open the Godoc in browser
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)

" Run/build/test/coverage/definiton
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <leader>d <Plug>(go-def-tab)

nmap <leader>T :tabnew term://$SHELL <CR>
inoremap <C-o> <c-o>:update<cr>
nmap <C-o> :update<cr>

" use goimports for formatting
let g:go_fmt_command = "goimports"

" turn highlighting on
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:syntastic_go_checkers = ['golint']

" Open go doc in vertical window, horizontal, or tab
au Filetype go nnoremap <leader>v :vsp <CR>:exe "GoDef" <CR>
au Filetype go nnoremap <leader>s :sp <CR>:exe "GoDef"<CR>
au Filetype go nnoremap <leader>t :tab split <CR>:exe "GoDef"<CR>
