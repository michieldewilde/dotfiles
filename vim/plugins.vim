if &compatible
  set nocompatible               " Be iMproved
endif
set runtimepath+=/Users/Coding/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('/Users/Coding/.cache/dein')
  call dein#begin('/Users/Coding/.cache/dein')

  " Dein manages dein
  call dein#add('/Users/Coding/.cache/dein/repos/github.com/Shougo/dein.vim')

  " ------------------------------------------------------------------------------
  " ColorSchemes {{{
  " ------------------------------------------------------------------------------
  call dein#add('NLKNguyen/papercolor-theme')
  call dein#add('vim-airline/vim-airline-themes')
  " }}}
  " ------------------------------------------------------------------------------

  " ------------------------------------------------------------------------------
  " Core {{{
  " ------------------------------------------------------------------------------
  call dein#add('tpope/vim-dispatch') " run tasks in a tmux split to not block vim
  call dein#add('tpope/vim-obsession') " improve vim session handling
  call dein#add('sheerun/vim-polyglot') " Syntax highlighting, indent, etc. for various file types
  call dein#add('vim-airline/vim-airline')
  call dein#add('jeffkreeftmeijer/vim-numbertoggle')
  " }}}

  " ------------------------------------------------------------------------------
  " Editing {{{
  " ------------------------------------------------------------------------------
  call dein#add('tpope/vim-abolish', { 'on': ['Abolish', 'Subvert'] }) " better search
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-repeat')
  call dein#add('w0rp/ale') " new async syntax checker for neovim
  call dein#add('tpope/vim-commentary') " easy commenting using vim motions
  call dein#add('takac/vim-hardtime') " forces efficient movement in vim
  call dein#add('terryma/vim-expand-region') " allow expanding visual selection region
  call dein#add('tpope/vim-sleuth') " smart indent width based on buffer and neigbouring files
  call dein#add('jiangmiao/auto-pairs') " [{()}]
  " }}}
  " ------------------------------------------------------------------------------

  " ------------------------------------------------------------------------------
  " Navigation {{{
  " ------------------------------------------------------------------------------
  call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
  call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
  call dein#add('justinmk/vim-sneak') " diagonal movements using S + 2 charaters
  call dein#add('christoomey/vim-tmux-navigator') " easy navigation between tmux and vim splits
  call dein#add('tpope/vim-unimpaired') " pairs of handy bracket mappings like [f and ]f for file switching
  call dein#add('thinca/vim-visualstar') " allows to use the * motion in visual mode
  " }}}
  " ------------------------------------------------------------------------------

  " ------------------------------------------------------------------------------
  " Completion {{{
  " ------------------------------------------------------------------------------
  call dein#add('SirVer/ultisnips')
  call dein#add('honza/vim-snippets')
  call dein#add('Shougo/deoplete.nvim', { 'on_i': 1 })
  
  " }}}
  " ------------------------------------------------------------------------------

  " ------------------------------------------------------------------------------
  " Javascript {{{
  " ------------------------------------------------------------------------------
  call dein#add('ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] })
  call dein#add('carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] })
  call dein#add('othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] })
  call dein#add('othree/yajs.vim', { 'for': 'javascript' })
  " }}}
  " ------------------------------------------------------------------------------

  " ------------------------------------------------------------------------------
  " Rust {{{
  " ------------------------------------------------------------------------------
  call dein#add('rust-lang/rust.vim', { 'for': 'rust' })
  " }}}
  " ------------------------------------------------------------------------------

  call dein#end()
  call dein#save_state()
endif
