#!/bin/bash
set -euo pipefail
IFS=$'\n\t'
# The above lines found in this article: https://dev.to/thiht/shell-scripts-matter

echo "Installing dotfiles to local system..."

echo "Symlinking files to $HOME..."
ln -s tmux.conf $HOME/.tmux.conf
