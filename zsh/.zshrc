# Autocomplete
  source ~/.local/src/zsh-autocomplete/zsh-autocomplete.plugin.zsh
  zstyle ':autocomplete:*' min-input 2
  zstyle ':autocomplete:*' ignored-input '..##'
  zstyle ':autocomplete:*' widget-style menu-select

# Beep
  unsetopt beep

# Bind key
  bindkey -e

# Colors
# https://i.stack.imgur.com/UQVe5.png
  autoload -U colors && colors

# Cursor
# Beam on startup
  echo -ne '\e[5 q'
# Beam for new prompt
  preexec() { echo -ne '\e[5 q' ;}

# Git
  autoload -U vcs_info
  precmd() { vcs_info }

  zstyle ':vcs_info:git:*' formats 'branch %b' # Format
  setopt PROMPT_SUBST
  RPROMPT=\$vcs_info_msg_0_ # Prompt

# Highlights
  typeset -A ZSH_HIGHLIGHT_STYLES

  ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
  ZSH_HIGHLIGHT_STYLES[alias]='fg=blue'
  ZSH_HIGHLIGHT_STYLES[cursor]='fg=magenta'
  ZSH_HIGHLIGHT_STYLES[path]='fg=cyan'
  ZSH_HIGHLIGHT_STYLES[globbing]='fg=cyan'
  ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=226'

# History
  HISTSIZE=1000
  SAVEHIST=1000
  HISTFILE=~/.config/zsh/.zsh_history

# Prompt - Starship
  eval "$(starship init zsh)"

# Source zmodules
  # Aliases
  for f in ~/.config/zsh/zmodules/*; do source "$f"; done

# VI mode
  bindkey -v
  export KEYTIMEOUT=1

# VIM - Edit line in Vim
  autoload edit-command-line; zle -N edit-command-line
  bindkey '^e' edit-command-line # Ctrl+E

# VIM - Tab complete menu bindings
  bindkey -v '^?' backward-delete-char
  bindkey -M menuselect 'h' vi-backward-char
  bindkey -M menuselect 'k' vi-up-line-or-history
  bindkey -M menuselect 'l' vi-forward-char
  bindkey -M menuselect 'j' vi-down-line-or-history
  bindkey -M menuselect '\r' accept-line

# VIM - VI mode cursor
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
# initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
      zle -K viins
      echo -ne "\e[5 q"
  }
  zle -N zle-line-init

# Load zsh-syntax-highlighting (should be last)
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# Not In Use

# Autosuggestions
# source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
#
# Autocomplete
#  autoload -U compinit
#  zstyle ':completion:*' menu select
#  zmodload zsh/complist
#  compinit -i
#  _comp_options+=(globdots) # Include hidden files
