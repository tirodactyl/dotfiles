#!/bin/bash
set -euo pipefail
IFS=$'\n\t'
# The above lines found in this article: https://dev.to/thiht/shell-scripts-matter

RUBY_VERSION="2.6.4"
NODE_VERSION="8.11.1"

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install xcode

echo "Installing xcode command line tools"
xcode-select --install || :

read -p "Press ENTER to continue once command line tools are installed"

echo "Gathering dependencies"
mkdir -p $HOME/dev/tirodactyl || :
git clone https://github.com/tirodactyl/dotfiles.git $HOME/dev/tirodactyl/dotfiles || :
cd $HOME/dev/tirodactyl/dotfiles && git pull && git checkout samsara

echo "\n Installing Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# see: github.com/kickstarter/laptop/pull/49 & github.com/Homebrew/brew/issues/3228
# sudo chown -R $(whoami) $(brew --prefix)/*

echo "\n Installing homebrew dependencies"
brew bundle

echo "\n Installing oh-my-zsh..."
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh || :

echo "\n Make zsh the default shell"
chsh -s /bin/zsh

echo "\n Installing FZF shell extensions"
/usr/local/opt/fzf/install

echo "\n Symlinking dotfiles"
sh ./bin/link.sh

echo "\n Generating local config"
touch ~/.bashrc.local || :
touch ~/.zshrc.local || :

echo "\n Setting up tmux"
mkdir -p ~/.tmux/plugins || :
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm || :

echo "\n Downloading & rebuilding terminfo for tmux-256color"
curl -LO http://invisible-island.net/datafiles/current/terminfo.src.gz
gunzip terminfo.src.gz
tic -x terminfo.src

echo "\n Setting up Ruby"
eval "$(rbenv init -)" 2> /dev/null
git clone git://github.com/tpope/rbenv-ctags.git ~/.rbenv/plugins/rbenv-ctags 2>/dev/null || :
rbenv install $RUBY_VERSION || :
rbenv global $RUBY_VERSION || :
gem install --conservative gem-ctags bundler rubocop || :

echo "\n Setting up Node"
eval "$(nodenv init -)" 2> /dev/null || :
nodenv install $NODE_VERSION || :
nodenv global $NODE_VERSION || :
yarn global add eslint typescript || :

echo "\n Setting up Go"
mkdir -p $HOME/dev/golang || :

echo "\n Copying over old preferences"
chmod 0600 ./plists/*
cp -R ./plists/ ~/Library/Preferences/ || :

echo "\n Configuring miscellaneous OSX settings"
./bin/configure.sh
