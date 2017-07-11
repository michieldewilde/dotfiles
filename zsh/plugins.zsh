### PLUGINS ###
export ZPLUG_HOME=~/.zplug
source $ZPLUG_HOME/init.zsh

export NVM_LAZY_LOAD=true

zplug "b4b4r07/enhancd", use:init.sh
zplug "b4b4r07/zsh-vimode-visual", use:"*.zsh", defer:3
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "lukechilds/zsh-nvm"
zplug "subnixr/minimal"

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

if zplug check b4b4r07/enhancd; then
    export ENHANCD_FILTER=fzf-tmux
fi

export FZF_TMUX=1
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
