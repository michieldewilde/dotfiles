ZSH_COMPDUMP="$HOME/.cache/zsh-completion-dump"

unsetopt flowcontrol     # output flow control via start/stop characters (usually assigned to ^S/^Q) is disabled in the shell’s editor
setopt menu_complete     # autoselect the first completion entry
setopt auto_menu         # show completion menu on succesive tab press
setopt complete_in_word  # allow completion in word
setopt always_to_end     # if a completion is performed with the cursor within a word, and a full completion is inserted, the cursor is moved to the end of the word

zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format $'\n%B%d%b\n'
