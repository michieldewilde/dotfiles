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

local base03="234"
local base02="235"
local base01="240"
local base00="241"
local base0="244"
local base1="245"
local base2="254"
local base3="230"
local yellow="136"
local orange="166"
local red="160"
local magenta="125"
local violet="61"
local blue="33"
local cyan="37"
local green="64"

export FZF_DEFAULT_OPTS="
--color fg:-1,bg:-1,hl:$blue,fg+:$base02,bg+:$base2,hl+:$blue
--color info:$yellow,prompt:$yellow,pointer:$base03,marker:$base03,spinner:$yellow
"

bindkey '^F' fzf-file-widget
export FZF_TMUX=1
export FZF_TMUX_HEIGHT=40%
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
