XDG_CONFIG_HOME=$HOME/.config
ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$XDG_CONFIG_HOME/zsh

# Theme
ZSH_THEME="agnoster"
DEFAULT_USER="tirso"

# Source oh-my-zsh
plugins=(
  colored-man-pages
  command-not-found
  cp
  gitfast
  golang
  osx
  rake-fast
  tirso
)

source $ZSH/oh-my-zsh.sh

# Make it easy to add machine-specific config
source ~/.zshrc.local

# Add custom scripts to path
export PROJECTS_PATH="$HOME/dev"
export PATH="$HOME/.bin:$PATH"

# Ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init --no-rehash -)" 2> /dev/null
(rbenv rehash &) 2> /dev/null # background rehash - much faster

# Node
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init --no-rehash -)" 2> /dev/null
(nodenv rehash &) 2> /dev/null # background rehash - much faster

# GO
export GOROOT="/usr/local/opt/go/libexec"
export GOPATH="$HOME/dev/golang"
export PATH="$GOPATH/bin:$PATH:$GOROOT/bin"

# FZF
export FZF_DEFAULT_COMMAND='rg --files --hidden'
export FZF_DEFAULT_OPTS='--bind tab:toggle-out,shift-tab:toggle-in,ctrl-a:select-all,ctrl-d:deselect-all'

alias reload='source ~/.zshrc'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
