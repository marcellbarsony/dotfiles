# Beep
unsetopt beep

# Bind key
bindkey -e

# Zsh Autocomplete
#source ~/.local/src/zsh-autocomplete/zsh-autocomplete.plugin.zsh
#zstyle '*:compinit' arguments -D -i -u -C -w
#bindkey '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete
#bindkey '\t' menu-select "$terminfo[kcbt]" menu-select
#bindkey -M menuselect '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete

# Compinit
# https://wiki.archlinux.org/title/zsh#Simple_.zshrc
autoload -Uz compinit && compinit

# Colors
# https://i.stack.imgur.com/UQVe5.png
autoload -U colors && colors

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
ZSH_HIGHLIGHT_REGEXP+=("'.*'" fg=yellow,bold)

# History
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.config/zsh/.zsh_history

# Prompt
eval "$(starship init zsh)" # Starship

# VI mode
bindkey -v
export KEYTIMEOUT=1

# VIM - Edit line
autoload edit-command-line
zle -N edit-command-line
bindkey '^e' edit-command-line # (Ctrl + e)

# VIM - Cursor
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

# Zsh Autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
#bindkey '^ ' autosuggest-accept

# Zsh Completions
zstyle ':completion:*' menu select

# Zsh Syntax Highlighting (source last)
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zmodules
for f in ~/.config/zsh/zmodules/*; do source "$f"; done
