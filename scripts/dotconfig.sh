#!/bin/bash

set -Eeuo pipefail

_configs_dir=$(find "$PWD/.config" -maxdepth 1 -mindepth 1 -type d -printf "%f\n")

for config_dir in $_configs_dir; do
    mkdir -p "$HOME/.config/$config_dir"
    ln -sfn "$PWD/.config/$config_dir/"* "$HOME/.config/$config_dir/"
done

# per-host overrides: hosts/<hostname>/.config/<dir>/* (skipped if none)
_host=$(cat /etc/hostname)
_host_dir="$PWD/hosts/$_host/.config"

if [ -d "$_host_dir" ]; then
    for config_dir in $(find "$_host_dir" -maxdepth 1 -mindepth 1 -type d -printf "%f\n"); do
        mkdir -p "$HOME/.config/$config_dir"
        ln -sfn "$_host_dir/$config_dir/"* "$HOME/.config/$config_dir/"
    done
fi
