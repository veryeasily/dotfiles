# rbenv should already be setup but we need to add the plugins and install a
# global ruby

RBENV_DIR="$( dirname "$0:A" )"

if ! hash rbenv 2>/dev/null; then
  eval "$("$HOME"/.rbenv/bin/rbenv init -)"
fi

# Install ruby-build
# https://github.com/rbenv/ruby-build
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build 2>/dev/null

# Install default-gems
# https://github.com/rbenv/rbenv-default-gems
git clone https://github.com/rbenv/rbenv-default-gems.git "$(rbenv root)"/plugins/rbenv-default-gems 2>/dev/null
ln -s "$RBENV_DIR"/default-gems "$(rbenv root)/default-gems"

RB_VERSION="$(rbenv install -l | grep -P -o '(?<=\s|^)(?:\d+\.){2}\d+(?=\s|$)' | tail -n 1)"
rbenv install "$RB_VERSION"
rbenv global "$RB_VERSION"
