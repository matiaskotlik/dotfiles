source ~/env.sh

if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
else 
  autoload -Uz compinit && compinit -d ~/.cache/zsh/zcompdump-$ZSH_VERSION

  if command -v antibody &> /dev/null && source <(antibody init); then
    antibody bundle zsh-users/zsh-autosuggestions
    antibody bundle zsh-users/zsh-syntax-highlighting
    antibody bundle agkozak/agkozak-zsh-prompt
  fi

  # zsh vim mode config
  source "$XDG_CONFIG_HOME/zsh/vi-mode.zsh"
  bindkey -v
  KEYTIMEOUT=1

  # aliases
  source "$XDG_CONFIG_HOME/zsh/aliases.zsh"

  # environment
  source "$HOME/env.sh"

  # window title config
  set_title () { # set window title
    echo -en "\e]2;$@\a"
  }
  precmd () { # set to cwd
    set_title "$PWD"
  }
  preexec () { # sets title to running process
    set_title "$PWD : $1"
  }

  # theme config
  AGKOZAK_PROMPT_DIRTRIM=6
  AGKOZAK_PROMPT_CHAR=('❯' '#' ':')
  AGKOZAK_CUSTOM_SYMBOLS=('⇣⇡' '⇣' '⇡' '+' 'x' '!' '>' '?')

  [[ -f ~/start.zsh ]] && source ~/start.zsh

  [[ -d "$SDKMAN_DIR" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

  HISTFILE="$HOME/.local/histfile"
  HISTSIZE=10000
  SAVEHIST=100000
  setopt appendhistory beep extendedglob nomatch notify
  unsetopt autocd
fi
