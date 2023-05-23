# Beep
unsetopt beep

# Bind key
bindkey -e

# Colors
# https://i.stack.imgur.com/UQVe5.png
autoload -U colors && colors
#LS_COLORS='rs=0:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:';
#export LS_COLORS

# Git
autoload -U vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats 'branch %b' # Format
setopt PROMPT_SUBST
RPROMPT=\$vcs_info_msg_0_ # Prompt

# Highlights
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern regexp cursor root line)
ZSH_HIGHLIGHT_STYLES[alias]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[cursor]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[path]='fg=blue'
ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[regexp]='fg=green'
# ZSH_HIGHLIGHT_STYLES[line]='fg=magenta'
# ZSH_HIGHLIGHT_STYLES[root]='fg=magenta'

# Highlights (regexp)
# https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/regexp.md
typeset -A ZSH_HIGHLIGHT_REGEXP
# ZSH_HIGHLIGHT_REGEXP+=('"*"' fg=magenta,bold) # Double quote
# ZSH_HIGHLIGHT_REGEXP+=("'*'" fg=magenta,bold) # Single quote
# ZSH_HIGHLIGHT_REGEXP+=("'.*" fg=red,bold)
#ZSH_HIGHLIGHT_REGEXP+=("'.*'" fg=yellow,bold)

# History
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.config/zsh/history

# Prompt (Starship)
eval "$(starship init zsh)"

# VI mode
bindkey -v
export KEYTIMEOUT=1

# VI mode - Edit line
autoload edit-command-line
zle -N edit-command-line
bindkey '^e' edit-command-line # Ctrl + e

# VI mode - Cursor
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
    [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
      [[ ${KEYMAP} == viins ]] ||
      [[ ${KEYMAP} = '' ]] ||
      [[ $1 = 'beam' ]]; then
    echo -ne '\e[3 q'
  fi
}

zle -N zle-keymap-select
zle -N zle-line-init
zle-line-init() {
    echo -ne "\e[3 q"
}

preexec() {
  echo -ne '\e[3 q'
}

# 0 - Block (blinking)
# 1 - Block (blinking - default)
# 2 - Block (static)
# 3 - Underline (blinking)
# 4 - Underline (static)
# 5 - Bar (blinking)
# 6 - Bar (static)

# Zsh Completions
#zmodload zsh/complist
#autoload -Uz compinit && compinit
#zstyle ':completion:*' menu select=0
#zstyle ':completion:*:*:*:*:descriptions' format '%F{blue}-- %d --%f'
#zstyle ':completion:*:history-words' remove-all-dups yes # ignore duplicate entries
#zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
#zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
#zstyle ':completion:*:warnings' format '%BNo matches for %d%b'
#zstyle ':completion:*' select-prompt '%SScrolling at %p%s'
#zstyle ':completion::complete:*' use-cache 1
#LISTMAX=-1

# Zsh Autocomplete (by Marlonrichert)
if [[ -f ~/.local/src/zsh-autocomplete/zsh-autocomplete.plugin.zsh ]]; then
  source ~/.local/src/zsh-autocomplete/zsh-autocomplete.plugin.zsh
else
  echo "Cannot source ZSH Autocomplete"
fi
bindkey '\t' menu-select "$terminfo[kcbt]" menu-select
bindkey -M menuselect '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
zstyle ':autocomplete:*' default-context ''
zstyle ':autocomplete:*' min-delay 0.00
zstyle ':autocomplete:*' min-input 2
zstyle ':autocomplete:*' ignored-input '..'
zstyle ':autocomplete:*' insert-unambiguous yes
zstyle ':autocomplete:*' widget-style menu-select
zstyle ':autocomplete:*' fzf-completion no
zstyle ':autocomplete:*' add-space executables aliases functions builtins reserved-words commands

# Zsh Autosuggestions
#if [[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
#  source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
#else
#  echo "Cannot source ZSH Autosuggestions"
#fi
#bindkey '^ ' autosuggest-accept # Ctrl + Space

# Zsh Syntax Highlighting (source last)
if [[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
else
  echo "Cannot source ZSH Syntax Highlighting"
fi

# zmodules
for f in ~/.config/zsh/zmodules/*; do source "$f"; done
