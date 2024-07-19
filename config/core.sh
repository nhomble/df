#!/usr/bin/env sh

function load_current() {
  local HOSTNAME=$(hostname)
  local HOST_FILE="${HOME}/.config/df/${HOSTNAME}.sh"

  PATH=$PATH:$HOME/bin
  PATH=$PATH:~/.local/bin

  [ -f $HOST_FILE ] && . $HOST_FILE
  . ~/.config/df/aliases.sh
  . ~/.config/df/editor.sh
  . ~/.config/df/prompt.sh
}

load_current
