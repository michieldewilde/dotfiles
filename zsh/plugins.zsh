### PLUGINS ###
export ZPLUG_HOME=~/.zplug
source $ZPLUG_HOME/init.zsh

zplug "b4b4r07/enhancd", use:init.sh
zplug "plugins/colorize", from:oh-my-zsh
zplug "plugins/osx", from:oh-my-zsh

zplug "b4b4r07/zsh-vimode-visual", use:"*.zsh", defer:3
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2

zplug "glidenote/hub-zsh-completion"
zplug 'Valodim/zsh-curl-completion'
zplug "Valiev/almostontop"

zplug "tsenart/vegeta", \
    as:command, \
    hook-build: 'go get -d && go build'

zplug "stedolan/jq", \
    as:command, \
    from:gh-r, \
    rename-to:jq

zplug "motemen/ghq", \
    as:command, \
    from:gh-r, \
    rename-to:ghq

zplug "reorx/httpstat", \
    as:command, \
    use:'(httpstat).py', \
    rename-to:'$1', \
    if:'(( $+commands[python] ))'

# Liquid prompt
LP_ENABLE_TIME=1
LP_USER_ALWAYS=1
LP_ENABLE_BATT=0
zplug 'nojhan/liquidprompt'

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

if zplug check motemen/ghq; then
    export GHQ_ROOT=$HOME/src
fi

export FZF_TMUX=1
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
