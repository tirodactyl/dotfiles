cask_args appdir: '/Applications'

# =========================================================
# Tap some casks
# =========================================================
tap 'homebrew/cask'
tap 'homebrew/bundle'
tap 'homebrew/core'
# for java
tap 'homebrew/cask-versions'
# for keyboards
# tap 'osx-cross/avr'
# tap 'qmk/qmk'
# for font support
tap 'homebrew/cask-fonts'

# =========================================================
# Quicklook extensions
# =========================================================
cask 'qlcolorcode'
cask 'qlimagesize'
cask 'qlmarkdown'
cask 'qlprettypatch'
cask 'qlstephen'
cask 'quicklook-csv'
cask 'quicklook-json'
cask 'webpquicklook'

# =========================================================
# Font me (includes Powerline patch in base font)
# =========================================================
cask 'font-source-code-pro'

# ===============================================
# Development
# ===============================================

# *Nix Tools
brew 'autoconf'
brew 'automake'
brew 'cmake'
brew 'coreutils'
brew 'makedepend'
brew 'pcre'
brew 'wget'

# Development tools
brew 'cmake'
brew 'direnv'
brew 'fzf'
brew 'git'
brew 'htop'
brew 'httpie'
brew 'hub'
brew 'neovim'
system 'pip3 install neovim'
brew 'p7zip'
brew 'reattach-to-user-namespace'
brew 'ripgrep'
brew 'tig'
brew 'tmux'
brew 'tree'
brew 'universal-ctags', args: ['HEAD']
brew 'watchman'
brew 'zsh'

# Libraries

# Languages
brew 'dep'
brew 'go'
brew 'nodenv'
brew 'rbenv'
brew 'rust'
brew 'yarn'

# Databases
brew 'mysql', restart_service: :changed
brew 'postgresql', restart_service: :changed
brew 'redis', restart_service: :changed

# Java things that require password
cask "caskroom/versions/java8"

# Keyboard things
# GNU compiler collection for AVR 8-bit and 32-bit Microcontrollers
# brew "osx-cross/avr/avr-gcc@8"
# GNU compiler collection for AVR 8-bit and 32-bit Microcontrollers
# brew "osx-cross/avr/avr-gcc@9"
# Quantum Mechanical Keyboard (QMK) Firmware
# brew "qmk/qmk/qmk"
# Toolbox companion for QMK Firmware
# cask "qmk-toolbox"

# ===============================================
# Applications
# ===============================================
cask 'alfred'
cask 'dash'
cask 'docker'
cask 'firefox-developer-edition'
cask 'google-chrome'
cask 'iterm2'
cask 'karabiner-elements'
cask 'meetingbar'
cask 'postman'
cask 'slack'
cask 'spotify'
cask 'vlc'
cask 'zoom'

# From Mac App Store
brew 'mas'

mas 'Amphetamine', id: 937984704
mas 'Magnet', id: 441258766
mas 'The Unarchiver', id: 425424353
mas "Xcode", id: 497799835
