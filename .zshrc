source $HOME/.dotfiles/antigen.zsh

antigen use oh-my-zsh
antigen bundle fasd

antigen apply

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#eval $(docker-machine env default)

export FZF_DEFAULT_COMMAND='ag -g ""'

# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

autoload -U promptinit && promptinit
prompt pure

# load aliases
source ~/.dotfiles/aliases.zsh
# getting fasd to work
eval "$(fasd --init posix-alias zsh-hook)"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[ -s "/Users/Coding/.scm_breeze/scm_breeze.sh" ] && source "/Users/Coding/.scm_breeze/scm_breeze.sh"

## set nvim as default
export EDITOR=/usr/local/bin/nvim

# Go Stuff
export GO15VENDOREXPERIMENT=1

# GOPATH
export GOPATH=$HOME/Development/go
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
