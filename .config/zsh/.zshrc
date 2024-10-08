#!/bin/zsh

# Load more configs
source "$XDG_CONFIG_HOME/zsh/promptrc"
source "$XDG_CONFIG_HOME/zsh/aliasrc"

# Enable colors
#autoload -Uz colors && colors

setopt AUTO_CD
stty stop undef	# Disable ctrl-s to freeze terminal

HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_find_no_dups
setopt hist_save_no_dups
setopt hist_reduce_blanks

bindkey "^p" history-search-backward
bindkey "^[[A" history-search-backward
bindkey "^n" history-search-forward
bindkey "^[[B" history-search-forward

# Completion
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu select
#zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
#zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Basic auto/tab complete
autoload -Uz compinit
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

## Edit line in vim with ctrl-e
autoload edit-command-line; zle -N edit-command-line
bindkey "^e" edit-command-line

# history-search-end
#autoload -Uz history-search-end
#zle -N history-beginning-search-backward-end history-search-end
#zle -N history-beginning-search-forward-end history-search-end
#bindkey "^[[A" history-beginning-search-backward-end
#bindkey "^[[B" history-beginning-search-forward-end
#bindkey -M vicmd "^[[A" history-beginning-search-backward-end
#bindkey -M vicmd "^[[B" history-beginning-search-forward-end
#bindkey -M vicmd "k" history-beginning-search-backward-end
#bindkey -M vicmd "j" history-beginning-search-forward-end

# Load and configure plugins
# zsh-abbrev-alias
source "$ZPLUGINS/zsh-abbrev-alias/abbrev-alias.plugin.zsh"
source "$ZDOTDIR/abbrevrc"
# history-search-multi-word
#source "$ZPLUGINS/history-search-multi-word/history-search-multi-word.plugin.zsh"
#zstyle ":plugin:history-search-multi-word" active "bg=magenta"
# zsh-autosuggestions
source "$ZPLUGINS/zsh-autosuggestions/zsh-autosuggestions.zsh"
# fast-syntax-highlighting
source "$ZPLUGINS/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
