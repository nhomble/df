#!/usr/bin/env sh

function load_current() {
  local HOSTNAME=$(hostname)
  local HOST_FILE="${HOME}/.config/df/${HOSTNAME}.sh"

  PATH=$PATH:$HOME/bin
  PATH=$PATH:~/.local/bin

  [ -f $HOST_FILE ] && . $HOST_FILE
  . /var/tmp/df-current.sh
  . ~/.config/df/aliases.sh
  . ~/.config/df/editor.sh
}

load_current
