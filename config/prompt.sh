#!/usr/bin/env sh

# default
export PROMPT='%F{green}%m %. %%%f '

[ ! -z "$BASH_VERSION" ] && {
  # bash
  # https://tldp.org/HOWTO/Bash-Prompt-HOWTO/x264.html
  export PROMPT='%F{green}%m %. %%%f '
}

[ ! -z "$ZSH_VERSION" ] && {
  # Autoload zsh's `add-zsh-hook` and `vcs_info` functions
  # (-U autoload w/o substition, -z use zsh style)
  autoload -Uz add-zsh-hook vcs_info

  # Set prompt substitution so we can use the vcs_info_message variable
  setopt prompt_subst

  # Run the `vcs_info` hook to grab git info before displaying the prompt
  add-zsh-hook precmd vcs_info

  zstyle ':vcs_info:*' formats ' %s(%F{cyan}%b%f)' # git(main)

  # {status}{root}{dir} %
  export PROMPT='%(?.%F{green}✓ %m%f .%F{red}⏺ %m%f )%(!.%K{red}%F{yellow}root%k%f .)%F{38;5;209}%2~ %%%f '
  export RPROMPT='$vcs_info_msg_0_ %F{8}⏱ %*%f'
}

