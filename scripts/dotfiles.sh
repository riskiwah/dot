#!/bin/bash

set -Eeuo pipefail

_configs_dir=(
    alacritty
    i3
    i3status
    nvim
    picom
)

for config_dir in "${_configs_dir[@]}"; do \
    #abc=`realpath "${_configs_dir[@]}" | cut -d'/' -f 6-`
    mkdir -p "$HOME/.config/${config_dir[*]}"
    ln -sfn "$PWD/.config/${config_dir[*]}"/* "$HOME/.config/${config_dir[*]}"
done