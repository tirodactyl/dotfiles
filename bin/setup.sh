#!/bin/bash
set -euo pipefail
IFS=$'\n\t'
# The above lines found in this article: https://dev.to/thiht/shell-scripts-matter

# =====================================================
# Install script for Tirso's dependencies and dotfiles
# =====================================================

RUBY_VERSION="2.5.1"
NODE_VERSION="8.11.1"

cd ~/dotfiles

echo "\n Installing dev tools"
xcode-select --install

echo "\n Installing Homebrew"
sudo chown -R $USER /usr/local
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "\n Installing homebrew dependencies"
brew bundle

echo "\n Symlinking dotfiles"
sh ./bin/link.sh

# echo "\n Installing git-aware-prompt"
# cd ~/.bash && git clone git://github.com/jimeh/git-aware-prompt.git
# cd ~/dotfiles

echo "\n Setting up Ruby"
eval "$(rbenv init -)" 2> /dev/null
rbenv install $RUBY_VERSION
rbenv global $RUBY_VERSION

echo "\n Setting up Node"
eval "$(nodenv init -)" 2> /dev/null
nodenv install $NODE_VERSION
nodenv global $NODE_VERSION
yarn global add eslint

# this makes finder show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -boolean true ; killall Finder

