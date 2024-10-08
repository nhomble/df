#!/usr/bin/env sh

. ~/.config/df/cargo.sh
alias python='python3'

export EDITOR="nvim"
export PATH="$HOME/.basher/bin:$PATH"   ##basher5ea843
eval "$(basher init - zsh)"             ##basher5ea843

export PATH=$PATH:$(npm bin)
export PATH=$PATH:$(npm bin -g)

export PATH="$HOME/bin:$PATH"
export PATH="/Users/nicolas/Library/Application Support/gin/bin:$PATH"
export PATH="/Users/nicolas/Library/Python/3.8/bin:$PATH"

source $HOMEBREW_PREFIX/opt/chruby/share/chruby/chruby.sh
chruby ruby-3.1.2
eval "$(/Users/nicolas/.local/bin/mise activate zsh)"
export PATH="/Users/nicolas/.moon/bin:$PATH"
