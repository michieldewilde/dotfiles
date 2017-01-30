source $HOME/.dotfiles/vim/general.vim
source $HOME/.dotfiles/vim/plugins.vim
source $HOME/.dotfiles/vim/bindings.vim
source $HOME/.dotfiles/vim/functions.vim

" If you have Neovim >= 0.1.5
if (has("termguicolors"))
  set termguicolors
endif

" TODO put following in files

" Disable mouse click to go to position
set mouse-=a

" Highlight 80th column
set colorcolumn=80

" Theme
syntax enable
set background=dark
colorscheme papercolor

let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 0
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
augroup end

set completeopt=longest,menuone,preview
let g:deoplete#sources = {}
let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs']
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]

let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let g:UltiSnipsExpandTrigger="<C-j>"
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
let g:SuperTabClosePreviewOnPopupClose = 1
