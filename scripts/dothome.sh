#!/bin/bash

set -Eeuo pipefail

for base in $(find $PWD -not -path "*/zsh/*" -type f ! -name ".git" ! -name ".gitignore" -name ".*" -printf '%f\n'); do \
    ln -sfn "$PWD/$base" "$HOME/"
done