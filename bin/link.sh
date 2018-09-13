#!/bin/bash
set -euo pipefail
IFS=$'\n\t'
# The above lines found in this article: https://dev.to/thiht/shell-scripts-matter

echo "Installing dotfiles to local system..."
DIR=`dirname $(cd $(dirname $0) && pwd -P)`
TARGET_DIR="$HOME"

# symlink top-level dotfiles to $HOME/
echo "=== Creating symlinks for dotfiles in $HOME/"
DOTFILES=$DIR/home/.[a-z]*

for file in $DOTFILES; do
  target_file="$TARGET_DIR/`basename $file`"
  source_file=$file

  if [ -e $target ]; then
    echo "WARNING: $target exists but not a symlink" && continue
  else
    ln -s $source_file $target_file
    echo "- $target"
  fi
done
