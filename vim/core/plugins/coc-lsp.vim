" Gopls config
if dein#tap('go-nvim')
    call coc#config('languageserver', {
      \ 'golang': {
        \ "command": "gopls",
        \ "rootPatterns": ["go.mod"],
        \ "disableWorkspaceFolders": "true",
        \ "filetypes": ["go"]
        \ }
        \})
endif

" ccls config
if dein#tap('chromatica.nvim')
    call coc#config('languageserver', {
      \ 'ccls': {
        \ "command": "ccls",
        \ "rootPatterns": [".ccls", "compile_commands.json", ".git/", ".hg/"],
        \ "filetypes": ["c","cpp","objc","objcpp"],
        \ "initializationOptions": {
          \ "cache":{
            \ "directory": "/tmp/ccls"
        \ }
        \ }
        \ }
        \})
endif

"python lsp config
if dein#tap('python-syntax')
    let g:python_highlight_all = 1
    call coc#add_extension('coc-python')
endif

"javascript lsp config
if dein#tap('vim-js')
  call coc#add_extension('coc-tsserver','coc-eslint','coc-prettier','coc-docthis')
endif

if dein#tap('yats.vim')
    call coc#add_extension('coc-tsserver','coc-eslint', 'coc-prettier', 'coc-tslint-plugin' ,'coc-docthis')
endif

"shell lsp config
if dein#tap('vim-sh')
    call coc#config('languageserver', {
      \ 'bash': {
        \ "command": "bash-language-server",
        \ "args" : ["start"],
        \ "rootPatterns": ["go.mod"],
        \ "ignoredRootPaths": ["~"],
        \ "filetypes": ["sh"]
        \ }
        \})
endif

if dein#tap('sql.vim')
endif
