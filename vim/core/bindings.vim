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

" gO to create a new line below cursor in normal mode
nnoremap go o<ESC>k
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

" Paste and keep indent
command! PasteCode call s:PasteCode()

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
nnoremap <leader>fep :e ~/development/src/github.com/michieldewilde/dotfiles/vim/core/plugins.vim<CR>

" Rename current file with <leader>fr
noremap <leader>fr :call RenameFile()<CR>

" Find file with <leader> ff
nnoremap <Leader>ff :Files<CR>
" Find file in history with <leader> fh
nnoremap <Leader>fh :History<CR>
nnoremap <Leader>fs :Rg<CR>

" }}}

" ==============================================================================
" Git Keybindings {{{
" ============================================================================
" Save
noremap <leader>gs :Gstatus<CR>
" }}}

" ==============================================================================
" Undo {{{
" ============================================================================
" Save
noremap <leader>ut :UndotreeToggle<CR>
noremap <leader>uf :UndotreeFocus<CR>
" }}}

" <Leader>f{char} to move to {char}
map  <Leader>fm <Plug>(easymotion-bd-f)
nmap <Leader>fm <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)
