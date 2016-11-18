# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
    git clone https://github.com/zplug/zplug ~/.zplug
    source ~/.zplug/init.zsh && zplug update --self
fi

# Essential
source ~/.zplug/init.zsh

zplug "zsh-users/zsh-syntax-highlighting", nice:10
zplug "plugins/git",   from:oh-my-zsh
zplug "lib/clipboard", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"
zplug "b4b4r07/enhancd", use:init.sh
zplug "mollifier/anyframe"

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug install

zplug load
