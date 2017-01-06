# List content of archive but don't extract
function ll-archive() {
    if [ -f "$1" ]; then
        case "$1" in
            *.tar.bz2|*.tbz2|*.tbz)  tar -jtf "$1"     ;;
            *.tar.gz)                tar -ztf "$1"     ;;
            *.tar|*.tgz|*.tar.xz)    tar -tf  "$1"     ;;
            *.gz)                    gzip -l  "$1"     ;;
            *.rar)                   rar vb   "$1"     ;;
            *.zip)                   unzip -l "$1"     ;;
            *.7z)                    7z l     "$1"     ;;
            *.lzo)                   lzop -l  "$1"     ;;
            *.xz|*.txz|*.lzma|*.tlz) xz -l    "$1"     ;;
        esac
    else
        echo "Sorry, '$1' is not a valid archive."
        echo "Valid archive types are:"
        echo "tar.bz2, tar.gz, tar.xz, tar, gz,"
        echo "tbz2, tbz, tgz, lzo, rar"
        echo "zip, 7z, xz and lzma"
    fi
}

# Extract an archive
function extract() {
    if [ -z "$2" ]; then 2="."; fi
    if [ -f "$1" ] ; then
        case "$1" in
            *.tar.bz2|*.tgz|*.tbz2|*.tbz) mkdir -v "$2" 2>/dev/null ; tar xvjf "$1" -C "$2"  ;;
            *.tar.gz)                     mkdir -v "$2" 2>/dev/null ; tar xvzf "$1" -C "$2"  ;;
            *.tar.xz)                     mkdir -v "$2" 2>/dev/null ; tar xvJf "$1"          ;;
            *.tar)                        mkdir -v "$2" 2>/dev/null ; tar xvf  "$1" -C "$2"  ;;
            *.rar)                        mkdir -v "$2" 2>/dev/null ; 7z x     "$1" -o"$2"   ;;
            *.zip)                        mkdir -v "$2" 2>/dev/null ; unzip    "$1" -d "$2"  ;;
            *.7z)                         mkdir -v "$2" 2>/dev/null ; 7z x     "$1" -o"$2"   ;;
            *.lzo)                        mkdir -v "$2" 2>/dev/null ; lzop -d  "$1" -p "$2"  ;;
            *.gz)                         gunzip "$1"                                        ;;
            *.bz2)                        bunzip2 "$1"                                       ;;
            *.Z)                          uncompress "$1"                                    ;;
            *.xz|*.txz|*.lzma|*.tlz)      xz -d "$1"                                         ;;
            *)
        esac
    else
        echo "Sorry, '$1' could not be decompressed."
        echo "Usage: extract <archive> <destination>"
        echo "Example: extract PKGBUILD.tar.bz2 ."
        echo "Valid archive types are:"
        echo "tar.bz2, tar.gz, tar.xz, tar, bz2,"
        echo "gz, tbz2, tbz, tgz, lzo,"
        echo "rar, zip, 7z, xz and lzma"
    fi
}

# compress a file or folder
function compress() {
    case "$1" in
        tar.bz2|.tar.bz2) tar cvjf "${2%%/}.tar.bz2" "${2%%/}/" ;;
        tbz2|.tbz2)       tar cvjf "${2%%/}.tbz2" "${2%%/}/"    ;;
        tbz|.tbz)         tar cvjf "${2%%/}.tbz" "${2%%/}/"     ;;
        tar.xz)           tar cvJf "${2%%/}.tar.xz" "${2%%/}/"  ;;
        tar.gz|.tar.gz)   tar cvzf "${2%%/}.tar.gz" "${2%%/}/"  ;;
        tgz|.tgz)         tar cvjf "${2%%/}.tgz" "${2%%/}/"     ;;
        tar|.tar)         tar cvf  "${2%%/}.tar" "${2%%/}/"     ;;
        rar|.rar)         rar a "${2}.rar" "$2"                 ;;
        zip|.zip)         zip -r -9 "${2}.zip" "$2"             ;;
        7z|.7z)           7z a "${2}.7z" "$2"                   ;;
        lzo|.lzo)         lzop -v "$2"                          ;;
        gz|.gz)           gzip -r -v "$2"                       ;;
        bz2|.bz2)         bzip2 -v "$2"                         ;;
        xz|.xz)           xz -v "$2"                            ;;
        lzma|.lzma)       lzma -v "$2"                          ;;
        *)                echo "Compress a file or directory."
            echo "Usage:   compress <archive type> <filename>"
            echo "Example: ac tar.bz2 PKGBUILD"
            echo "Please specify archive type and source."
            echo "Valid archive types are:"
            echo "tar.bz2, tar.gz, tar.gz, tar, bz2, gz, tbz2, tbz,"
            echo "tgz, lzo, rar, zip, 7z, xz and lzma." ;;
    esac
}

# Recursively fix dir/file permissions on a given directory
function fix-dir-perm() {
    if [ -d $1 ]; then
        find $1 -type d -exec chmod 755 {} \;
        find $1 -type f -exec chmod 644 {} \;
    else
        echo "$1 is not a directory."
    fi
}

# Create a directory and "cd" into it
function mkd() {
    mkdir "${1}" && cd "${1}"
}

# Find files using ZSH globbing
function glob-find-files-by-name() {
    ll **/*(#i)($1)*(.)
}

# Backup a file
function backup-file() {
    cp -r "$1"{,.bak};
}

function gfar() {
  for remote in `git branch -r`; do git branch --track $remote; done
  git fetch --all
  git pull --all
}

# Modified version where you can press
#   - CTRL-O to open with `open` command,
#   - CTRL-E or Enter key to open with the $EDITOR
functions fo() {
  local out file key
  IFS=$'\n' out=($(fzf-tmux --query="$1" --exit-0 --expect=ctrl-o,ctrl-e))
  key=$(head -1 <<< "$out")
  file=$(head -2 <<< "$out" | tail -1)
  if [ -n "$file" ]; then
    [ "$key" = ctrl-o ] && open "$file" || ${EDITOR:-vim} "$file"
  fi
}

# fkill - kill process
fkill() {
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
    sudo kill -${1:-9} $pid
  fi
}

# fbr - checkout git branch (including remote branches)
fbr() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# fco - checkout git branch/tag
fco() {
  local tags branches target
  tags=$(
    git tag | awk '{print "\x1b[31;1mtag\x1b[m\t" $1}') || return
  branches=$(
    git branch --all | grep -v HEAD             |
    sed "s/.* //"    | sed "s#remotes/[^/]*/##" |
    sort -u          | awk '{print "\x1b[34;1mbranch\x1b[m\t" $1}') || return
  target=$(
    (echo "$tags"; echo "$branches") |
    fzf-tmux -l30 -- --no-hscroll --ansi +m -d "\t" -n 2) || return
  git checkout $(echo "$target" | awk '{print $2}')
}

# fs [FUZZY PATTERN] - Select selected tmux session
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
fs() {
  local session
  session=$(tmux list-sessions -F "#{session_name}" | \
    fzf --query="$1" --select-1 --exit-0) &&
  tmux switch-client -t "$session"
}

# Update zplug
function update_zplug {
	echo '———> Updating zplug...';
    zplug update --self
	echo '———> Updating zplug packages...';
	zplug update
}

function update_mac {
    update_zplug()
	echo '———> Running brew update...';
	brew update;
	echo '———> Running brew upgrade...';
	brew upgrade --all;
	echo '———> Running brew cleanup...';
	brew cleanup;
	echo '———> Running brew prune...';
	brew prune;
	echo '———> Running brew doctor...';
	brew doctor;
}
