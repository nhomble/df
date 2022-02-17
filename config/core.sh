#!/usr/bin/env sh

function load_current() {
  local HOSTNAME=$(hostname)
  local HOST_FILE="${HOME}/.config/df/${HOSTNAME}.sh"
  cat $HOST_FILE > /var/tmp/df-current.sh

  PATH=$PATH:$HOME/bin
  PATH=$PATH:~/.local/bin

  . ~/.config/df/aliases.sh
  . ~/.config/df/editor.sh
  . /var/tmp/df-current.sh
}

load_current
