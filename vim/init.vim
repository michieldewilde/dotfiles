call plug#begin()

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-expand-region'
Plug 'itchyny/vim-cursorword'
Plug 'altercation/vim-colors-solarized'
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" colorscheme
colorscheme solarized
set background=light

" true color
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" set leader
let mapleader = "\<Space>"
" show feedback when leader has been pressed and is waiting
set showcmd

nnoremap <Leader>fw :w<CR>

" copy & paste to system clipboard with <leader>p and <leader>y
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" expand region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" open file by <leader> ff
nnoremap <Leader>ff :Files<CR>

" open buffer by <leader> fb
nnoremap <Leader>fb :Buffers<CR>

" Add line numbers
set number
