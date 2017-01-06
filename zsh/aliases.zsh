# Global commands aliases
alias -g G='| grep'
alias -g N='| grep -v'
alias -g C='| wc -l'
alias -g S='| sort'
alias -g H='| head'
alias -g L="| less"
alias -g T='| tail'

# Get OS X Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
alias update='sudo softwareupdate -i -a; brew update; brew upgrade --all; brew cleanup; npm install npm -g; npm update -g; sudo gem update --system; sudo gem update'

# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

# edit and reload config files
alias ea='nvim ~/.dotfiles/zsh/aliases.zsh'
alias ep='nvim ~/.dotfiles/zsh/plugins.zsh'
alias eh="sudo nvim /etc/hosts"
alias ev='nvim ~/.dotfiles/vim/init.vim'
alias ez='nvim ~/.dotfiles/zsh/zshrc'
alias et='nvim ~/.dotfiles/tmux/tmux.conf'
alias rz='source ~/.dotfiles/zsh/zshrc'

# clean and reset git repository
alias nah='git reset --hard;git clean -df;'

# Homebrew
alias brewu='brew update && brew upgrade && brew cleanup && brew prune && brew doctor'

# Just handy stuff
alias mkdir="mkdir -p"
alias l="ls -al"
alias ll="ls -al"
alias opf="open -a finder"

# Tmux
alias tmux="TERM=screen-256color-bce tmux"
alias tns="tmux new -s"
alias tat="tmux attach -t"
alias tst="tmux switch -t"
alias tls="tmux list-sessions"

function hs() {
    cd ~/Development/Homestead

    if [ $1 = "edit" ]; then
        open ~/.homestead/homestead.yaml
    else
        if [ -z "$command" ]; then 
            command="ssh"
        fi

        eval "vagrant ${command}"
    fi

    #switch back to directory where command was performed in
    cd -
}

# Edit all files that are conflicted
alias gde="git diff --name-only | uniq | xargs $EDITOR"
alias gdf="git diff --color | diff-so-fancy"

# Aliases only for non root users
if [[ $UID != 0 || $EUID != 0 ]]; then
    alias sudo='sudo ' # Allow aliases to be sudo’ed
else
    alias brewinstall='brew install'
    alias brewremove='brew uninstall'
    alias brewupdate='brew update'
fi

# 1 letter commands shortcuts
alias x=' exit'
alias h='history'
alias j='jobs'
alias v='nvim'
alias e='nvim'

# Find things...
alias f='grep -rinw "." -e ' ## inside files
alias ack='ack -Hir' ## inside files advanced
alias ff='find . -type f -iname ' ## insensitive filename

# Network & ISP tests
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'
alias myips="ifconfig -a | grep -o 'inet6\? \(ad\?dr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:|adr:)? ?/, \"\"); print }' | grep -v '127.0.0.1' | grep -v '::1'"
alias localip="ifconfig | grep -Eo 'inet (addr:|adr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"
alias speedtest="wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip"
alias ipstats="netstat -ntu | tail -n +3 | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -n"
alias ports="lsof -ni | grep LISTEN"

# Curl & web helpers
alias dl='curl --continue-at - --location --progress-bar --remote-name --remote-time' # Download remote file
alias wget-site='wget --mirror -p --convert-links -P'

# Laravel helpers
alias art='php artisan'
alias mig-install='php artisan migrate:install'
alias mig-seed='php artisan migrate:refresh --seed'

for method in GET HEAD POST PUT DELETE PURGE TRACE OPTIONS; do
    alias "$method"="http '$method'"
done

# Date & time helpers
alias cal='cal -3'
alias week='date +%V'
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'

# Others commands shortcuts
alias rd='rmdir'
alias md='mkdir -p'
alias rmf="rm -rf"
alias rmrf="rm -rf"
alias bak='backup-file'
alias tailf='tail -f'
alias less='less -r'
alias whereis='whereis'
alias grep='grep --color=auto'
alias vgrep='grep -v --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# set git to hub
alias git=hub
alias gs='git status'

# kill all the tabs in chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chrome_kill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

# URL-encode strings
# usage: urlencode "<string>"
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# string to json
# usage: jsonify "<string>"
alias jsonify='python -c '"'"'import json, sys; input_str=sys.argv[1]; print json.loads(input_str.replace("\n", "\\n").replace("\r", "\\r"));'"'"' '
