#!/usr/bin/env sh
export LIBGL=ALWAYS_INDIRECT=1

. ~/.config/df/kube.sh
. ~/.config/df/terraform.sh
. ~/.config/df/cargo.sh

alias term='st'
alias python='python3'

NOTE_DIR=~/.notepad_dir
isNOTE=false
temp=$(ps aux | grep NOTES | grep -v grep | awk '{print $2}')
if [[ "$PPID" = "$temp" ]]; then
	if [[ ! -e "$NOTE_DIR" ]]; then
		echo $HOME > $NOTE_DIR
	fi
	cd "$(cat $NOTE_DIR)"
	isNOTE=true;
fi

function cd(){
	builtin cd "$@";
	if [[ $isNOTE = true ]]; then
		pwd > $NOTE_DIR
	fi	
	return
}

if [[ -n "$XTERM_VERSION" ]]; then
    command -v transset-df &> /dev/null && transset-df --id "$WINDOWID" &> /dev/null
fi

command -v ~/bin/boot/start &> /dev/null && ~/bin/boot/start

export GOPATH=$HOME/dev/go
export GOBIN=$HOME/bin

function godoc(){
    go doc $@
}
