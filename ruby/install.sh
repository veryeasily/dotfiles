# rbenv should already be setup but we need to add the plugins and install a
# global ruby

CUR_SCRIPT_DIR="$( dirname "$0:A" )"

if ! hash rbenv 2>/dev/null; then
  git clone git@github.com:rbenv/rbenv.git "$HOME"/.rbenv
  eval "$("$HOME"/.rbenv/bin/rbenv init -)"
fi

RBENV_DIR="$(rbenv root)"

# Install ruby-build
# https://github.com/rbenv/ruby-build
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build 2>/dev/null

# Install default-gems
# https://github.com/rbenv/rbenv-default-gems
git clone https://github.com/rbenv/rbenv-default-gems.git "$(rbenv root)"/plugins/rbenv-default-gems 2>/dev/null
[[ -h "$RBENV_DIR"/default-gems ]] || ln -s "$CUR_SCRIPT_DIR"/default-gems "$RBENV_DIR"/default-gems

RB_VERSION="$(rbenv install -l | grep -P -o '(?<=\s|^)(?:\d+\.){2}\d+(?=\s|$)' | tail -n 1)"
rbenv install "$RB_VERSION"
rbenv global "$RB_VERSION"
