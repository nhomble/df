#!/usr/bin/env sh

source /etc/profile.d/bash_completion.sh
export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0
source <(kubectl completion bash)
complete -F __start_kubectl k
