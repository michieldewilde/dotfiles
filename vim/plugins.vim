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
  call dein#add('morhetz/gruvbox')
  call dein#add('vim-airline/vim-airline-themes')
  " }}}
  " ------------------------------------------------------------------------------

  " ------------------------------------------------------------------------------
  " Core {{{
  " ------------------------------------------------------------------------------
  call dein#add('tpope/vim-obsession') " improve vim session handling
  " }}}

  " ------------------------------------------------------------------------------
  " Editing {{{
  " ------------------------------------------------------------------------------
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-repeat')
  call dein#add('w0rp/ale') " new async syntax checker for neovim
  call dein#add('scrooloose/nerdcommenter') " easy commenting using vim motions
  call dein#add('jiangmiao/auto-pairs') " [{()}]
  " }}}
  " ------------------------------------------------------------------------------

  " ------------------------------------------------------------------------------
  " Completion {{{
  " ------------------------------------------------------------------------------
  call dein#add('maralla/completor.vim')
  " }}}
  " ------------------------------------------------------------------------------

  " ------------------------------------------------------------------------------
  " Navigation {{{
  " ------------------------------------------------------------------------------
  call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
  call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
  " }}}
  " ------------------------------------------------------------------------------

  " ------------------------------------------------------------------------------
  " Javascript {{{
  " ------------------------------------------------------------------------------
  call dein#add('ternjs/tern_for_vim', { 'build': 'npm install', 'for': ['javascript', 'javascript.jsx'] })
  call dein#add('moll/vim-node', { 'for': 'javascript' })
  call dein#add('pangloss/vim-javascript', { 'for': 'javascript' })
  call dein#add('othree/yajs.vim', { 'for': 'javascript' })
  call dein#add('heavenshell/vim-jsdoc', { 'for': 'javascript' })
  " }}}
  " ------------------------------------------------------------------------------

  " ------------------------------------------------------------------------------
  " Typescript {{{
  " ------------------------------------------------------------------------------
  call dein#add('Quramy/tsuquyomi', { 'build': 'make -f make_mac.mak', 'for': 'typescript' })
  call dein#add('leafgarland/typescript-vim', { 'for': 'typescript' })
  call dein#add('Quramy/vim-js-pretty-template', { 'for': 'typescript' })
  call dein#add('jason0x43/vim-js-indent', { 'for': 'typescript' })
  call dein#add('mhartington/vim-typings', { 'for': 'typescript' })
  " }}}
  " ------------------------------------------------------------------------------

  " ------------------------------------------------------------------------------
  " Visual {{{
  " ------------------------------------------------------------------------------
  call dein#add('sheerun/vim-polyglot') " Syntax highlighting, indent, etc. for various file types
  call dein#add('vim-airline/vim-airline')
  call dein#add('jeffkreeftmeijer/vim-numbertoggle')
  call dein#add('roman/golden-ratio')
  call dein#add('christoomey/vim-tmux-navigator')
  call dein#add('airblade/vim-gitgutter')
  " }}}
  " ------------------------------------------------------------------------------


  " ------------------------------------------------------------------------------
  " Markdown {{{
  " ------------------------------------------------------------------------------
  call dein#add('suan/vim-instant-markdown')
  " }}}
  " ------------------------------------------------------------------------------

  call dein#end()
  call dein#save_state()
endif
