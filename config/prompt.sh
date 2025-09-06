#!/usr/bin/env sh

_git_info() {
  branch=$(git branch --show-current 2>/dev/null)
  [ -n "$branch" ] && echo " $branch" && return
  sha=$(git rev-parse --short HEAD 2>/dev/null)
  [ -n "$sha" ] && echo " $sha" && return
  echo ""
}

# default
export PROMPT='%F{green}%m %. %%%f '

[ ! -z "$BASH_VERSION" ] && {
  # bash
  # https://tldp.org/HOWTO/Bash-Prompt-HOWTO/x264.html
  git_info() {
    git branch --show-current 2>/dev/null || { git rev-parse --short HEAD 2>/dev/null | sed 's/^/⌥/'; } 2>/dev/null || true
  }
  export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$([ -n "$(git_info)" ] && echo " (\[\033[01;33m\]$(git_info)\[\033[00m\])")\$ '
}

[ ! -z "$ZSH_VERSION" ] && {
  export ZSH="$HOME/.oh-my-zsh"
  ZSH_THEME="agnoster"
  # otherwise Desktop/ and dev/ are matched!
  CASE_SENSITIVE="true"
  # TODO move out of prompt when I have a good place
  plugins=(
    direnv
  )
  source $ZSH/oh-my-zsh.sh
  GREEN="%{$fg_bold[green]%}"
  YELLOW="%{$fg_bold[yellow]%}"
  AWS_YELLOW="%{$FG[208]%}"
  CYAN="%{$fg_bold[cyan]%}"
  RED="%{$fg_bold[red]%}"
  RESET="%{$reset_color%}"

  _aws_info() {
    [ -n "$AWS_PROFILE" ] && echo " %{$FG[208]%}($AWS_PROFILE)%{$reset_color%}"
  }

  setopt prompt_subst
  export PROMPT='%(?.%F{green}✓ %m%f .%F{red}⏺ %m%f )%(!.%K{red}%F{yellow}root%k%f .)%F{38;5;209}%2~ %%%f '
  export RPROMPT='${DF_JSDEBUG_ON:+𖢥 }$(_git_info)$(_aws_info)%F{8} %* ⏱%f'
}

