#!/bin/bash

set -Eeuo pipefail

# Installing plugins
echo "Install the plugins..."
cat "$PWD"/vscode/extension-lists | xargs -L 1 code --install-extension > /dev/null 2>&1

# symlink it!
ln -sfn "$PWD"/vscode/settings.json "$HOME"/.config/Code/User