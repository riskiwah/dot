#!/bin/bash
#
# basic: # find "$PWD/zsh" -type f -printf '%f\n'


set -Eeuo pipefail

# themes
ln -sfn "$PWD"/zsh/test2.zsh-theme "$HOME"/.oh-my-zsh/themes/

for i in $(find "$PWD/zsh" -type f -not -name "test2*" -printf '%f\n'); do \
    ln -sfn "$PWD/zsh/$i" "$HOME"/
done