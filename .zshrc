source $HOME/.dotfiles/antigen.zsh

ZSH_THEME="oh-my-git"

antigen use oh-my-zsh
antigen bundle fasd
antigen theme https://github.com/caiogondim/bullet-train-oh-my-zsh-theme bullet-train
antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply

# load aliases
source ~/.dotfiles/aliases.zsh

# User configuration
# getting fasd to work
eval "$(fasd --init posix-alias zsh-hook)"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[ -s "/Users/Coding/.scm_breeze/scm_breeze.sh" ] && source "/Users/Coding/.scm_breeze/scm_breeze.sh"

# setup fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# set nvim as default
export EDITOR=/usr/local/bin/nvim

# don't use tilda inside path use $HOME
export PATH="/usr/local/bin:$PATH:$GOPATH/bin"

eval $(docker-machine env default)

fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

# expand !! with a space to see command that will be executed
bindkey ' ' magic-space

# set shell in vi mode
bindkey -v

# delay timeout vi
export KEYTIMEOUT=1

function fzf-select-history() {
    BUFFER=$(history -n -r 1 | fzf --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N fzf-select-history
bindkey '^r' fzf-select-history
