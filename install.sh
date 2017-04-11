#!/bin/bash
# Installs the dotfiles onto a newly provisioned server
#
# We use GNU stow to place the dotfiles, so here we install that

# Command check notation borrowed from:
# http://stackoverflow.com/a/677212/1243823
if [[ $(hash apt-get 2>/dev/null) ]]; then
  hash stow 2>/dev/null || sudo apt-get update && sudo apt-get install -y stow
elif [[ $(hash yum 2>/dev/null) ]]; then
  hash stow 2>/dev/null || yum install -y stow --enablerepo=epel
else
  echo "Neither apt-get nor yum found. Terminating..."
  exit 1
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

stow -t "$HOME"/ -S "$DIR"/root

# Now fix YouCompleteMe
if [[ ! $(hash python 2>/dev/null) && $(hash git 2>/dev/null) ]]; then
  echo "Python or git is missing. Skipping optional YouCompleteMe install."
  exit 0
fi

pushd $DIR/root/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
python install.py --tern-completer
popd
