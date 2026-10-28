#!/bin/bash
#
# basic: # find "$PWD/zsh" -maxdepth 1 -type f -printf '%f\n'


set -Eeuo pipefail

# themes
ln -sfn "$PWD"/zsh/test2.zsh-theme "$HOME"/.oh-my-zsh/themes/

for i in $(find "$PWD/zsh" -maxdepth 1 -type f -not -name "test2*" -printf '%f\n'); do \
    ln -sfn "$PWD/zsh/$i" "$HOME"/
done
# completions (sourced by .zshrc)
mkdir -p "$HOME"/.oh-my-zsh/completions
ln -sfn "$PWD"/zsh/completions/* "$HOME"/.oh-my-zsh/completions/
