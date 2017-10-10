#!/usr/bin/env zsh

DOTFILES_DIR="$( dirname "$0:A" )"

pushd "$DOTFILES_DIR"

if ! rg --help | grep ripgrep 2>&1 1>/dev/null; then
  cd $HOME/Downloads
  wget https://github.com/BurntSushi/ripgrep/releases/download/0.6.0/ripgrep-0.6.0-x86_64-unknown-linux-musl.tar.gz
  tar -zxvf ripgrep-0.6.0-x86_64-unknown-linux-musl.tar.gz
  cd ripgrep-0.6.0-x86_64-unknown-linux-musl
  sudo ln -s "$(pwd)"/rg /usr/bin/rg
  sudo ln -s "$(pwd)"/rg.1 /usr/share/man/man1/rg.1
  popd
fi

if ! hash rbenv 2>/dev/null; then
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv
  pushd ~/.rbenv && src/configure && make -C src
  popd
  eval "$(~/.rbenv/bin/rbenv init -)"
  mkdir -p "$(rbenv root)"/plugins
  git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
  git clone https://github.com/rbenv/rbenv-default-gems.git "$(rbenv root)"/plugins/rbenv-default-gems
  RB_VERSION="$(rbenv install -l | grep -P -o '(?<=\s|^)(?:\d+\.){2}\d+(?=\s|$)' | tail -n 1)"
  rbenv install "$RB_VERSION"
  rbenv global "$RB_VERSION"
fi

# if ! hash yarn 2>/dev/null; then
#   curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
#   echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
#   sudo apt-get update && sudo apt-get install yarn
# fi
