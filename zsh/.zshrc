# History
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

# Beep
unsetopt beep

# Bind key
bindkey -e

# GIT
autoload -U vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats 'branch %b' # Format
setopt PROMPT_SUBST
RPROMPT=\$vcs_info_msg_0_ # Prompt

# Colors & Prompt
autoload -U colors && colors
PS1="%B%{$fg[white]%}[%{$fg[green]%}%n%{$fg[white]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[white]%}]%{$reset_color%}$%b "

# Autocomplete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# VI mode
bindkey -v
export KEYTIMEOUT=1

# VIM bindings
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor on VI mode
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init

# Cursor
echo -ne '\e[5 q' # Beam cursor on startup
preexec() { echo -ne '\e[5 q' ;} # Beam cursor for new prompt

# Load zsh-syntax-highlighting (should be last)
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null