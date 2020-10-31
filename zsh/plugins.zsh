#
# Programs
#

zplugin ice from"gh-r" as"program" mv"direnv* -> direnv" atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' pick"direnv"
zplugin light direnv/direnv

zplugin light b4b4r07/enhancd

export NVM_LAZY_LOAD=true
zplugin ice wait"0" lucid
zplugin light lukechilds/zsh-nvm

#
# Completions
#

zplugin ice wait"0" blockf silent
zplugin light zsh-users/zsh-completions

#
# Docker completions.
#
zplugin ice as"completion"
zplugin snippet https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker

#
# Scripts
#

zplugin ice as"program" pick"bin/archey"
zplugin load obihann/archey-osx

zplugin ice from"gh" wait"0" silent pick"history-search-multi-word.plugin.zsh" lucid
zplugin light zdharma/history-search-multi-word

zplugin ice wait"0" atload"_zsh_autosuggest_start" silent
zplugin light zsh-users/zsh-autosuggestions

zplugin ice wait"1" atinit"zpcompinit; zpcdreplay" silent
