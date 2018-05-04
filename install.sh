#!/bin/bash
set -euo pipefail
IFS=$'\n\t'
# The above lines found in this article: https://dev.to/thiht/shell-scripts-matter

current_dir=$(dirname $0)
dotfiles_path=$PWD/$current_dir
# vimfiles_path=$dotfiles_path/vimfiles

echo "Installing dotfiles to local system..."

#took some stuff from here...

echo "=== Creating symlinks for dotfiles"
cd $dotfiles_path
for name in symlink/*; do
  name=$(echo $name|cut -c 9-)
  target=$HOME/.$name

  if [ -e $target ]; then
    echo "WARNING: $target exists but not a symlink" && continue
  else
    ln -s $dotfiles_path/symlink/$name $HOME/.$name
  fi
done
cd -
