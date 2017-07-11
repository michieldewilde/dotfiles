source $HOME/development/src/github.com/michieldewilde/dotfiles/vim/general.vim
source $HOME/development/src/github.com/michieldewilde/dotfiles/vim/plugins.vim
source $HOME/development/src/github.com/michieldewilde/dotfiles/vim/bindings.vim
source $HOME/development/src/github.com/michieldewilde/dotfiles/vim/functions.vim

" Disable mouse click to go to position
set mouse-=a

" Highlight 80th column
set colorcolumn=80

if (has("termguicolors"))
 set termguicolors
endif

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Theme
syntax enable
set background=dark
colorscheme gruvbox
set completeopt=menu

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"

let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 0
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {
      \   'javascript': ['eslint'],
      \}
let g:ale_sign_column_always = 1

autocmd Filetype c setlocal tabstop=8 shiftwidth=8 expandtab
autocmd Filetype javascript setlocal tabstop=4 shiftwidth=4 expandtab
