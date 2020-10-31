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
alias ea='nvim ~/development/src/github.com/michieldewilde/dotfiles/zsh/aliases.zsh'
alias ep='nvim ~/development/src/github.com/michieldewilde/dotfiles/zsh/plugins.zsh'
alias eh="sudo nvim /etc/hosts"
alias ev='nvim ~/development/src/github.com/michieldewilde/dotfiles/vim/init.vim'
alias ez='nvim ~/development/src/github.com/michieldewilde/dotfiles/zsh/zshrc'
alias et='nvim ~/development/src/github.com/michieldewilde/dotfiles/tmux/tmux.conf'
alias rz='source ~/development/src/github.com/michieldewilde/dotfiles/zsh/zshrc'

# clean and reset git repository
alias nah='git reset --hard;git clean -df;'

# Homebrew
alias brewu='brew update && brew upgrade && brew cleanup && brew prune && brew doctor'

# Diffing
alias nvimdiff="nvim -d"

# Just handy stuff
alias mkdir="mkdir -p"
alias l="exa -abghl --git --color=automatic"
alias ll="exa -abghl --git --color=automatic"
alias opf="open -a finder"

# Tmux
alias tmux="TERM=screen-256color-bce tmux"
alias tns="tmux new -s"
alias tat="tmux attach -t"
alias tst="tmux switch -t"
alias tls="tmux list-sessions"
alias tks="tmux kill-session -t"

# Edit all files that are conflicted
alias gde="git diff --name-only | uniq | xargs $EDITOR"
alias gdf="git diff"
alias gs="git gs"
alias gco="git checkout"
alias gcm="git commit -m"

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

# URL-encode strings
# usage: urlencode "<string>"
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# string to json
# usage: jsonify "<string>"
alias jsonify='python -c '"'"'import json, sys; input_str=sys.argv[1]; print json.loads(input_str.replace("\n", "\\n").replace("\r", "\\r"));'"'"' '

# ------------------------------------
# Docker alias and function
# ------------------------------------

# Get latest container ID
alias dl="docker ps -l -q"

# Get container process
alias dps="docker ps"

# Get process included stop container
alias dpa="docker ps -a"

# Get images
alias di="docker images"

# Get container IP
alias dip="docker inspect --format '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}'"

# Run deamonized container, e.g., $dkd base /bin/echo hello
alias dkd="docker run -d -P"

# Run interactive container, e.g., $dki base /bin/bash
alias dki="docker run -i -t -P"

# Execute interactive container, e.g., $dex base /bin/bash
alias dex="docker exec -i -t"

# Stop all containers
dstop() { docker stop $(docker ps -a -q); }

# Remove all containers
drm() { docker rm $(docker ps -a -q); }

# Stop and Remove all containers
alias drmf='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'

# Remove all images
dri() { docker rmi $(docker images -q); }

# Dockerfile build, e.g., $dbu tcnksm/test
dbu() { docker build -t=$1 .; }

# Show all alias related docker
dalias() { alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; }

# fstash - easier way to deal with stashes
# type fstash to get a list of your stashes
# enter shows you the contents of the stash
# ctrl-d shows a diff of the stash against your current HEAD
# ctrl-b checks the stash out as a branch, for easier merging
fstash() {
  local out q k sha
  while out=$(
    git stash list --pretty="%C(yellow)%h %>(14)%Cgreen%cr %C(blue)%gs" |
    fzf --ansi --no-sort --query="$q" --print-query \
        --expect=ctrl-d,ctrl-b);
  do
    mapfile -t out <<< "$out"
    q="${out[0]}"
    k="${out[1]}"
    sha="${out[-1]}"
    sha="${sha%% *}"
    [[ -z "$sha" ]] && continue
    if [[ "$k" == 'ctrl-d' ]]; then
      git diff $sha
    elif [[ "$k" == 'ctrl-b' ]]; then
      git stash branch "stash-$sha" $sha
      break;
    else
      git stash show -p $sha
    fi
  done
}

alias stream_dronezone='mplayer -playlist http://somafm.com/dronezone130.pls'
alias stream_groovesalad='mplayer -playlist http://somafm.com/groovesalad130.pls'
alias stream_defcon='mplayer -playlist http://somafm.com/defcon130.pls'

alias did="vim +'normal Go' +'r!date' ~/did.txt"
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
alias path='echo -e ${PATH//:/\\n}'
