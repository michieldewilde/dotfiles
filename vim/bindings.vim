" ==============================================================================
" General Keybindings {{{
" ============================================================================

" Fix annoying typo's of WQ, QA and Q
command! WQ wq
command! Wq wq

"w!! to save file with sudo
cmap w!! w !sudo tee % > /dev/null

command! W w
command! WW w

command! Q q

command! QA qa
command! Qa qa

" Wrapped lines goes down/up to next row, rather than next line in file.
noremap j gj
noremap k gk

inoremap jk <esc>

" Find merge conflict markers
noremap <leader>gm /\v^[<\|=>]{7}( .*\|$)<CR>

" tabpage mappings
noremap <Leader>tn :tabnext<CR>
noremap <Leader>t :tabnew<CR>

" buffer mappings
noremap <Leader>bn :bn<CR>
noremap <Leader>bp :bp<CR>
nnoremap <Leader>bf :Buffers<CR>

" session mappings
noremap <leader>m :call WriteSession()<CR>

" custom comma motion mapping
nnoremap di, f,dT,
nnoremap ci, f,cT,
nnoremap da, f,ld2F,i,<ESC>l "delete argument
nnoremap ca, f,ld7F,i,<ESC>a "delete arg and insert

"Replace mappings
nnoremap <leader>rl 0:s/
nnoremap <leader>rp {ma}mb:'a,'bs/

" upper or lowercase the current word
nnoremap g^ gUiW
nnoremap gv guiW

" gO to create a new line below cursor in normal mode
nnoremap go o<ESC>k

" go to create a new line above cursor
nnoremap gO O<ESC>j

" I really hate that things don't auto-center
nnoremap G Gzz
nnoremap n nzz
nnoremap N Nzz
nnoremap } }zz
nnoremap { {zz

" open tag in new tab with <C-\>
noremap <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" Make Y behave like other capital commands.
" Hat-tip http://vimbits.com/bits/11
nnoremap Y y$

" Toggle highlight search with <leader>thl
nnoremap <leader>thl :set hlsearch!<CR>

" close buffer with leader-q
" and safe & close buffer with leader-wq
nnoremap <leader>q :bd<CR>
nnoremap <leader>wq :w<CR>:bd<CR>

" Paste and keep indent
command! PasteCode call s:PasteCode()

" Go to previous and next item in quickfix list
noremap <leader>cn :cnext<CR>
noremap <leader>cp :cprev<CR>
" }}}

" Copy & paste to and from system clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" expand region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" ==============================================================================
" File Keybindings {{{
" ============================================================================
" Save
noremap <leader>sf :w<CR>

" Open vimrc with <leader>fed
nnoremap <leader>fed  :e $MYVIMRC<CR>
nnoremap <leader>feR :source $MYVIMRC<CR>
nnoremap <leader>fep :e ~/.dotfiles/vim/plugins.vim<CR>

" Rename current file with <leader>fr
noremap <leader>fr :call RenameFile()<CR>

" Find file with <leader> ff
nnoremap <Leader>ff :Files<CR>
" Find file in history with <leader> fh
nnoremap <Leader>fh :History<CR>
nnoremap <Leader>fs :Ag<CR>

" }}}
