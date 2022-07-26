# Beep
  unsetopt beep

# Bind key
  bindkey -e
  bindkey -s '^s' spotify-tui

# Colors
  autoload -U colors && colors
  # https://i.stack.imgur.com/UQVe5.png

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
  for f in ~/.config/zsh/zmodules/*; do source "$f"; done

# VI mode
  bindkey -v
  export KEYTIMEOUT=1

  # VIM - Edit line
    autoload edit-command-line
    zle -N edit-command-line
    bindkey '^e' edit-command-line # (Ctrl + E)

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
    # 1 - Block (blinking, default)
    # 2 - Block (static)
    # 3 - Underline (blinking)
    # 4 - Underline (static)
    # 5 - Bar (blinking)
    # 6 - Bar (static)


# Zsh-Autocomplete
  source ~/.local/src/zsh-autocomplete/zsh-autocomplete.plugin.zsh

  zstyle ':autocomplete:*' default-context ''
  zstyle ':autocomplete:*' min-delay 0.05
  zstyle ':autocomplete:*' min-input 2
  zstyle ':autocomplete:*' ignored-input '..'
  zstyle ':autocomplete:*' list-lines 16
  zstyle ':autocomplete:history-search:*' list-lines 16
  zstyle ':autocomplete:history-incremental-search-*:*' list-lines 16
  zstyle ':autocomplete:*' recent-dirs cdr
  zstyle ':autocomplete:*' insert-unambiguous yes
  zstyle ':autocomplete:*' widget-style menu-select
  zstyle ':autocomplete:*' fzf-completion no
  zstyle ':autocomplete:*' add-space executables aliases functions builtins reserved-words commands

  # Up arrow:
  bindkey '\e[A' up-line-or-search
  bindkey '\eOA' up-line-or-search
  # Down arrow:
  bindkey '\e[B' down-line-or-select
  bindkey '\eOB' down-line-or-select
  # Control-Space:
  bindkey '\0' list-expand

  # Uncomment the following lines to disable live history search:
  # zle -A {.,}history-incremental-search-forward
  # zle -A {.,}history-incremental-search-backward

  bindkey -v '^?' backward-delete-char
  bindkey -M menuselect 'h' vi-backward-char
  bindkey -M menuselect 'k' vi-up-line-or-history
  bindkey -M menuselect 'l' vi-forward-char
  bindkey -M menuselect 'j' vi-down-line-or-history
  bindkey -M menuselect '\r' accept-line



# Zsh-Autosuggestions
  source ~/.local/src/zsh-autosuggestions/zsh-autosuggestions.zsh

# Zsh-Completions
#  fpath=(~/.local/src/zsh-completions/src $fpath)
#  autoload -Uz compinit && compinit
#  zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

# Zsh-Syntax-highlighting
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
