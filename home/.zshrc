XDG_CONFIG_HOME=$HOME/.config
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="agnoster"
DEFAULT_USER="tirso"
ZSH_CUSTOM=$XDG_CONGIF_HOME/zsh

# Source oh-my-zsh
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

source $HOME/.commonrc

alias reload='source ~/.zshrc'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
