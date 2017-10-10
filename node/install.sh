#!/usr/bin/env zsh

SCRIPT_DIR="$(dirname "$0:A")"

if [[ ! -d "$HOME"/.nvm ]]; then
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.5/install.sh | bash
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  nvm install node
  nvm alias default node
fi

echo "$SCRIPT_DIR"
if ! hash yarn 2>/dev/null; then
  . "$SCRIPT_DIR"/install-yarn.sh
fi
