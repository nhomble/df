#!/usr/bin/env sh

# default
export PROMPT='%F{green}%m %. %%%f '

[ ! -z "$BASH_VERSION" ] && {
  # bash
  # https://tldp.org/HOWTO/Bash-Prompt-HOWTO/x264.html
  export PROMPT='%F{green}%m %. %%%f '
}

[ ! -z "$ZSH_VERSION" ] && {
  export ZSH="$HOME/.oh-my-zsh"
  ZSH_THEME="agnoster"

  # TODO move out of prompt when I have a good place
  plugins=(
    git
    git-prompt
    aws
  )
  source $ZSH/oh-my-zsh.sh
  GREEN="%{$fg_bold[green]%}"
  YELLOW="%{$fg_bold[yellow]%}"
  AWS_YELLOW="%{$FG[208]%}"
  CYAN="%{$fg_bold[cyan]%}"
  RED="%{$fg_bold[red]%}"
  RESET="%{$reset_color%}"
  ZSH_THEME_GIT_PROMPT_PREFIX=" $CYAN"
  ZSH_THEME_GIT_PROMPT_SUFFIX=""
  ZSH_THEME_GIT_PROMPT_DIRTY=" $RED⦿"
  ZSH_THEME_GIT_PROMPT_CLEAN=" $GREEN⦾"

  ZSH_THEME_AWS_PROFILE_PREFIX="${AWS_YELLOW}aws("
  ZSH_THEME_AWS_PROFILE_SUFFIX=")${RESET}"
  setopt prompt_subst
  export PROMPT='%(?.%F{green}✓ %m%f .%F{red}⏺ %m%f )%(!.%K{red}%F{yellow}root%k%f .)%F{38;5;209}%2~ %%%f '
  export RPROMPT='$(git_prompt_info) $(aws_prompt_info)%F{8} %* ⏱%f'
}

