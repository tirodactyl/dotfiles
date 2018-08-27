if [ uname == "Darwin" ]; then
  # install homebrew if not present -- link added on 14.04.2017
  if [ command -v brew >/dev/null 2>&1 ]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
  brew update

  # install for tmux copy/paste
  brew install reattach-to-user-namespace
fi

