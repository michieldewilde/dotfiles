if &compatible
  set nocompatible               " Be iMproved
endif
set runtimepath+=/Users/mdw/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('/Users/mdw/.cache/dein')
  call dein#begin('/Users/mdw/.cache/dein')

  " Dein manages dein
  call dein#add('Shougo/dein.vim')
  call dein#add('wsdjeg/dein-ui.vim')
  call dein#add('haya14busa/dein-command.vim')

  " Core {{{
  call dein#add('tpope/vim-obsession') " improve vim session handling
  call dein#add('Shougo/vimproc.vim', {'build' : 'make'})

  " Editing
  call dein#add('tpope/vim-surround')
  call dein#add('tomtom/tcomment_vim')
  call dein#add('tpope/vim-repeat')
  call dein#add('jiangmiao/auto-pairs')
  call dein#add('tpope/tpope-vim-abolish')
  call dein#add('brooth/far.vim')
  call dein#add('ntpeters/vim-better-whitespace')

  " Navigation
  call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
  call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })

  " Rust
  call dein#add('rust-lang/rust.vim', { 'for': 'rust' })

  " Visual {{{
  call dein#add('itchyny/lightline.vim')
  call dein#add('jeffkreeftmeijer/vim-numbertoggle')
  call dein#add('roman/golden-ratio')
  call dein#add('christoomey/vim-tmux-navigator')
  call dein#add('junegunn/goyo.vim')

  call dein#add('AndrewRadev/splitjoin.vim')

  " VCS
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-rhubarb')

  " Golang
  call dein#add('fatih/vim-go')

  " Completion
  call dein#add('natebosch/vim-lsc')
  call dein#add('ajh17/VimCompletesMe')
  call dein#end()
  call dein#save_state()
endif

let g:lsc_server_commands = {
\ 'golang': {
\   'command': 'gopls',
\   'log_level': -1,
\   'suppress_stderr': v:true,
\ },
\}

let g:lsc_auto_map = {
 \  'GoToDefinition': 'gd',
 \  'FindReferences': 'gr',
 \  'Rename': 'gR',
 \  'ShowHover': 'K',
 \  'FindCodeActions': 'ga',
 \  'Completion': 'omnifunc',
 \}

let g:lsc_enable_autocomplete  = v:true
let g:lsc_enable_diagnostics   = v:false
let g:lsc_reference_highlights = v:false
let g:lsc_trace_level          = 'off'
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

source $HOME/development/src/github.com/michieldewilde/dotfiles/vim/core/plugins/go.vim
source $HOME/development/src/github.com/michieldewilde/dotfiles/vim/core/plugins/fzf.vim
