#!/bin/bash

set -Eeuo pipefail

_configs_dir=$(find "$PWD/.config" -maxdepth 1 -mindepth 1 -type d -printf "%f\n")

for config_dir in $_configs_dir; do
    mkdir -p "$HOME/.config/$config_dir"
    ln -sfn "$PWD/.config/$config_dir/"* "$HOME/.config/$config_dir/"
done