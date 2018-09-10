#!/bin/bash
set -euo pipefail
IFS=$'\n\t'
# The above lines found in this article: https://dev.to/thiht/shell-scripts-matter

current_dir=$(dirname $0)
dotfiles_path=$PWD/$current_dir
# vimfiles_path=$dotfiles_path/vimfiles

echo "Installing dotfiles to local system..."

#took some stuff from here...

# symlink true dotfiles into ~/
echo "=== Creating symlinks for dotfiles in $HOME/"
cd $dotfiles_path
for name in symlink/*; do
  name=$(echo $name|cut -c 9-)
  target=$HOME/.$name

  if [ -e $target ]; then
    echo "WARNING: $target exists but not a symlink" && continue
  else
    ln -s $dotfiles_path/symlink/$name $target
    echo "- linked to $target"
  fi
done

# symlink into .config
echo "=== Creating symlinks for other configuration files in $HOME/.config/"
for name in config/*; do
  name=$(echo $name|cut -c 9-)
  target=$HOME/.config/$name

  if [ -e $target ]; then
    echo "WARNING: $target exists but not a symlink" && continue
  else
    ln -s $dotfiles_path/config/$name $target
    echo "- linked to $target"
  fi
done

# go back to where you came from
cd -

# this makes finder show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -boolean true ; killall Finder
