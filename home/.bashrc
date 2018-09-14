alias reload='source ~/.bashrc'

export EDITOR='vim'

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

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
