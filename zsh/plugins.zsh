### PLUGINS ###
export ZPLUG_HOME=~/.zplug
source `brew --prefix zplug`/init.zsh

zplug "aws/aws-cli", use:"bin/aws_zsh_completer.sh"
zplug "b4b4r07/enhancd", use:init.sh
zplug "plugins/colorize", from:oh-my-zsh
zplug "plugins/osx", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:3 # Should be loaded 2nd last.
zplug "Valiev/almostontop"
zplug "seebi/dircolors-solarized"

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

if zplug check seebi/dircolors-solarized; then
    eval "$(gdircolors ${ZPLUG_HOME}/repos/seebi/dircolors-solarized/dircolors.ansi-light)"
fi

bindkey '^F' fzf-file-widget
export FZF_TMUX=1
export FZF_TMUX_HEIGHT=40%
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
