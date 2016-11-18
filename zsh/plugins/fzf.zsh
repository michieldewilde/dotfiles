bindkey '^F' fzf-file-widget
export FZF_TMUX=1
export FZF_TMUX_HEIGHT=100%
export FZF_DEFAULT_COMMAND='
    ag --depth 10 -f --hidden \
    --ignore .git -g ""'
export FZF_DEFAULT_OPTS='
    --color fg:242,bg:233,hl:65,fg+:15,bg+:234,hl+:108
    --color info:108,prompt:109,spinner:108,pointer:168,marker:168'
