#!/bin/bash
# Installs the dotfiles onto a newly provisioned server
#
# We use GNU stow to place the dotfiles, so here we install that

# Command check notation borrowed from:
# http://stackoverflow.com/a/677212/1243823

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if ! hash stow 2>/dev/null; then
  if hash apt-get 2>/dev/null; then
    sudo apt-get update && sudo apt-get install -y stow
  elif hash yum 2>/dev/null; then
    sudo yum install -y stow --enablerepo=epel
  else
    echo "Neither apt-get nor yum found. Terminating..."
    exit 1
  fi
fi

echo "stow -t $HOME/ -S $DIR/root"
./stow.sh

if ! grep 'bash_profile_extras' ~/.bash_profile; then
  echo 'hi'
fi

if ! hash zsh 2>/dev/null; then
  sudo apt-get update && sudo apt-get install -y zsh
fi

chsh -s $(which zsh)

git submodule update --init --recursive

sudo mkdir -p /usr/local/lib
sudo git clone https://github.com/rbenv/rbenv "/usr/local/lib/rbenv"
sudo git clone https://github.com/pyenv/pyenv "/usr/local/lib/pyenv"

source $DIR/extras.sh

# Now fix YouCompleteMe
# if ! hash python 2>/dev/null && hash git 2>/dev/null; then
#   echo "Python or git is missing. Skipping optional YouCompleteMe install."
#   exit 0
# fi
# 
# pushd $DIR/root/.vim/bundle
# git submodule update --init --recursive
# pushd YouCompleteMe
# python install.py --tern-completer
# popd
# popd
