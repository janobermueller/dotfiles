# Load prompt
source "$XDG_CONFIG_HOME/zsh/promptrc"

# Enable colors
autoload -U colors && colors

setopt AUTO_CD			# Automatically cd into typed directory
setopt HIST_IGNORE_ALL_DUPS	# Show history entries only once
setopt HIST_REDUCE_BLANKS	# Remove superfluous blanks from each command added to history
stty stop undef			# Disable ctrl-s to freeze terminal

# History in cache directory
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete
autoload -U compinit
zstyle ":completion:*" menu select
zmodload zsh/complist
compinit -d ~/.cache/zsh/zcompdump-$ZSH_VERSION
_comp_options+=(globdots)	# Include hidden files

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu
bindkey -M menuselect "h" vi-backward-char
bindkey -M menuselect "k" vi-up-line-or-history
bindkey -M menuselect "l" vi-forward-char
bindkey -M menuselect "j" vi-down-line-or-history
bindkey -v "^?" backward-delete-char

# Change cursor shape for different vi modes
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = "block" ]]; then
    echo -ne "\e[1 q"
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = "" ]] ||
       [[ $1 = "beam" ]]; then
    echo -ne "\e[5 q"
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne "\e[5 q" # Use beam shape cursor on startup
preexec() { echo -ne "\e[5 q" ;} # Use beam shape cursor for each new prompt.

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp" >/dev/null
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s "^o" "lfcd\n"
bindkey -s "^a" "bc -l\n"
bindkey -s "^f" 'cd "$(dirname "$(fzf)")"\n'
bindkey "^[[P" delete-char

# Edit line in vim with ctrl-e
autoload edit-command-line; zle -N edit-command-line
bindkey "^e" edit-command-line

# history-search-end
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end
bindkey -M vicmd "^[[A" history-beginning-search-backward-end
bindkey -M vicmd "^[[B" history-beginning-search-forward-end
bindkey -M vicmd "k" history-beginning-search-backward-end
bindkey -M vicmd "j" history-beginning-search-forward-end

# Load autojump
source /usr/share/autojump/autojump.zsh

# Load and configure plugins
# zsh-abbrev-alias
source "$ZPLUGINS/zsh-abbrev-alias/abbrev-alias.plugin.zsh"
source "$XDG_CONFIG_HOME/zsh/aliasrc"
# history-search-multi-word
source "$ZPLUGINS/history-search-multi-word/history-search-multi-word.plugin.zsh"
zstyle ":plugin:history-search-multi-word" active "bg=magenta"
# zsh-autosuggestions
source "$ZPLUGINS/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh"
# fast-syntax-highlighting
source "$ZPLUGINS/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
