alias e="nvim "

# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

# Get OS X Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
alias update='sudo softwareupdate -i -a; brew update; brew upgrade --all; brew cleanup; npm install npm -g; npm update -g; sudo gem update --system; sudo gem update'

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

# One of @janmoesen’s ProTip™s
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
  alias "$method"="lwp-request -m '$method'"
done

# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

alias ea='nvim ~/.dotfiles/aliases.zsh' #alias edit
alias ev='nvim ~/.dotfiles/.vimrc'
alias ez='nvim ~/.dotfiles/.zshrc'
alias et='nvim ~/.dotfiles/.tmux.conf'
alias ra='source ~/.dotfiles/aliases.zsh'  #alias reload
alias rz='source ~/.dotfiles/.zshrc'


# Git Aliases
alias gs='git status'
alias gr='git rebase'
alias gri= 'git rebase -i'
alias gbd='git branch -D'
alias gi='nvim .gitignore'
alias ga='git add -A'
alias gl='git l'
alias gf='git fetch'
alias gd='git diff'
alias gda='git diff --cached'
# Staged and cached are the same thing
alias gpl='git pull'
alias gplr='git pull --rebase'
alias gps='git push'
alias gpsh='git push -u origin `git rev-parse --abbrev-ref HEAD`'
alias gnb='git nb' # new branch aka checkout -b
alias grs='git reset'
alias grsh='git reset --hard'
alias gcd='git checkout develop'
alias gcm='git checkout master'
alias gcs='git checkout staging'
alias gcb='git checkout -b'
alias nah='git reset --hard;git clean -df;'

# Common shell functions
alias less='less -r'
alias tf='tail -f'
alias l='less'
alias cl='clear'

# Homebrew
alias brewu='brew update && brew upgrade && brew cleanup && brew prune && brew doctor'

# Just handy stuff
alias mkdir="mkdir -p"
alias ll="ls -al"
alias opf="open -a finder"
alias go=colorgo
mkc() {
  mkdir -p "$1" && cd "$1" || return 1
}

# Tmux
alias tmux="TERM=screen-256color-bce tmux"
alias tns="tmux new -s"
alias tat="tmux attach -t"
alias tst="tmux switch -t"
alias tls="tmux list-sessions"

# ps
alias psa="ps aux"
alias ga="alias | grep "
alias psg="ps aux | grep "

# edit hosts
alias eh="sudo nvim /etc/hosts"

# lock screen
alias lock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# fetch all remote branches
gfar() {
  for remote in `git branch -r`; do git branch --track $remote; done
  git fetch --all
  git pull --all
}

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
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"

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

# Edit all files that are conflicted
alias gde="git diff --name-only | uniq | xargs $EDITOR"
