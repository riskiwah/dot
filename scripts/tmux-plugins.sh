#!/bin/bash

set -Eeuo pipefail

plugin_dir="${HOME}/.tmux/plugins"

plugins=(
  "tpm https://github.com/tmux-plugins/tpm v3.1.0"
  "tmux-resurrect https://github.com/tmux-plugins/tmux-resurrect v4.0.0"
  "tmux-continuum https://github.com/tmux-plugins/tmux-continuum v3.1.0"
)

mkdir -p "$plugin_dir"

for entry in "${plugins[@]}"; do
  read -r name url ref <<<"$entry"
  dest="${plugin_dir}/${name}"

  if [[ ! -d "${dest}/.git" ]]; then
    git clone --quiet "$url" "$dest"
  fi

  git -C "$dest" fetch --quiet --tags origin
  git -C "$dest" checkout --quiet "$ref"
  echo "${name} @ ${ref}"
done

echo
echo "Next: start tmux and press 'prefix + I' to let tpm wire the plugins in."
