# {{{ Beep
unsetopt beep
# }}}

# {{{ Colors
# https://i.stack.imgur.com/UQVe5.png
autoload -U colors && colors
# }}}

# {{{ Git
autoload -U vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats 'branch %b'
setopt PROMPT_SUBST
RPROMPT=\$vcs_info_msg_0_
# }}}

# {{{ Highlights
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern regexp cursor root line)
ZSH_HIGHLIGHT_STYLES[alias]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[cursor]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[path]='fg=blue'
ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[regexp]='fg=green'
#ZSH_HIGHLIGHT_STYLES[line]='fg=white'
#ZSH_HIGHLIGHT_STYLES[root]='fg=white'
# }}}

# {{{ Highlights (regexp)
# https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/regexp.md
typeset -A ZSH_HIGHLIGHT_REGEXP
#ZSH_HIGHLIGHT_REGEXP+=('"*"' fg=magenta,bold) # Double quote
#ZSH_HIGHLIGHT_REGEXP+=("'*'" fg=magenta,bold) # Single quote
#ZSH_HIGHLIGHT_REGEXP+=("'.*" fg=red,bold)
#ZSH_HIGHLIGHT_REGEXP+=("'.*'" fg=yellow,bold)
# }}}

# {{{ History
HISTSIZE=1000
SAVEHIST=$HISTSIZE
HISTFILE=~/.cache/zsh/history
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups
# bindkey '^n' history-search-backward
# bindkey '^e' history-search-forward
# }}}

# {{{ Prompt (Starship)
eval "$(starship init zsh)"
# }}}

# {{{ Pywal
# (cat ~/.cache/wal/sequences &) # Terminal
# source ~/.cache/wal/colors-tty.sh # TTY
# }}}

# {{{ VI mode
bindkey -v
# export KEYTIMEOUT=1 # Conflicts with Autocomplete
# }}}

# {{{ VI mode [Edit line]
autoload edit-command-line
zle -N edit-command-line
bindkey '^f' edit-command-line # Ctrl + f
# }}}

# {{{ VI mode [Cursor]
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

zle-line-init() {
    echo -ne "\e[3 q"
}
zle -N zle-line-init

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
# }}}

# {{{ FZF
eval "$(fzf --zsh)"
# }}}

# {{{ ZSH [Autocomplete]
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
zstyle ':autocomplete:*' min-delay 0.05
zstyle ':autocomplete:*' min-input 2
zstyle ':autocomplete:*' ignored-input '..'
zstyle ':autocomplete:*' insert-unambiguous yes
zstyle ':autocomplete:*' widget-style menu-select
zstyle ':autocomplete:*' fzf-completion no
zstyle ':autocomplete:*' add-space executables aliases functions builtins reserved-words commands
# zstyle ':autocomplete:*' list-colors "${(s.:.)LS_COLORS}" # ls colors
# }}}

# {{{ ZSH [Autosuggestions]
if [[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
else
  echo "Cannot source ZSH Autosuggestions"
fi
bindkey '^ ' autosuggest-accept # Ctrl + Space
# }}}

# {{{ ZSH [Syntax highlight] (source last)
if [[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
else
  echo "Cannot source ZSH Syntax Highlighting"
fi
# }}}

# ZSH [zmodules] {{{
for f in ~/.config/zsh/zmodules/*; do source "$f"; done
# }}}
