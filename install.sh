#!/bin/bash
# Installs the dotfiles onto a newly provisioned server
#
# We use GNU stow to place the dotfiles, so here we install that

# Command check notation borrowed from:
# http://stackoverflow.com/a/677212/1243823
if hash apt-get 2>/dev/null; then
  apt-get update
fi

if ! hash stow 2>/dev/null; then
  if hash apt-get 2>/dev/null; then
    hash stow 2>/dev/null || sudo apt-get install -y stow
  elif hash yum 2>/dev/null; then
    hash stow 2>/dev/null || sudo yum install -y stow --enablerepo=epel
  else
    echo "Neither apt-get nor yum found. Terminating..."
    exit 1
  fi
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "stow -t $HOME/ -S $DIR/root"
pushd $DIR
stow -t "$HOME"/ -S root
popd

if ! hash zsh 2>/dev/null; then
  sudo apt install -y zsh
fi

chsh -s $(which zsh)

Now fix YouCompleteMe
if ! hash python 2>/dev/null && hash git 2>/dev/null; then
  echo "Python or git is missing. Skipping optional YouCompleteMe install."
  exit 0
fi

pushd $DIR/root/.vim/bundle
git submodule update --init --recursive
pushd YouCompleteMe
python install.py --tern-completer
popd
popd
